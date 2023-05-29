import 'package:course_mobile/model/user_model.dart';
import 'package:course_mobile/router/router.dart';
import 'package:course_mobile/service/user_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AuthProvider extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final userApi = UserAPI();
  var _sucess = false;
  var _verificationId;
  var _userModel = UserModel();
  var _loading = false;
  get userModel => _userModel;
  get loading => _loading;
  get verificationId => _verificationId;
  get sucess => _sucess;
  FlutterSecureStorage storage = FlutterSecureStorage(); //

  Future<void> verifyOTP({required String otp}) async {
    try {
      if (_verificationId == null || _verificationId == "") {
        _sucess = false;
      } else {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp);
        if (credential.smsCode == otp) {
          signInWithPhone(credential);
        }
      }
    } catch (e) {
      _sucess = false;
      rethrow;
    }
  }

  Future<void> signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        await register();
      } else {
        _sucess = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendOTP() async {
    try {
      _loading = true;
      notifyListeners();
      String? phoneNumber = await storage.read(key: "phoneNumber");
      await auth.verifyPhoneNumber(
        phoneNumber: "+856${phoneNumber}",
        verificationCompleted: (phoneAuthCredential) {
          ///
          _loading = false;
          // notifyListeners();
        },
        verificationFailed: (error) {},
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        },
      );
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> otp({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      _loading = true;
      notifyListeners();
      await storage.delete(key: "firstName");
      await storage.delete(key: "lastName");
      await storage.delete(key: "phoneNumber");
      await storage.delete(key: "password");
      await storage.write(key: "firstName", value: firstName);
      await storage.write(key: "lastName", value: lastName);
      await storage.write(key: "phoneNumber", value: phoneNumber);
      await storage.write(key: "password", value: password);
      _loading = false;
      _sucess = true;
      notifyListeners();
    } catch (e) {
      print("Error =====>$e");
    }
  }

  Future<void> login(
      {required String phoneNumber, required String password}) async {
    try {
      _loading = true;
      notifyListeners();
      final result =
          await userApi.login(phoneNumber: phoneNumber, password: password);
      if (result != null) {
        print("=======> Login Successful");
        _userModel = result;

        navService.pushNamed(RouterAPI.home);
        _loading = false;
        notifyListeners();
      } else {
        print("=======> ເບີໂທ ແລະ ລະຫັດຜ່ານບໍ່ຖທກຕ້ອງ");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register() async {
    try {
      _loading = true;
      notifyListeners();
      String? firstName = await storage.read(key: "firstName");
      String? lastName = await storage.read(key: "lastName");
      String? phoneNumber = await storage.read(key: "phoneNumber");
      String? password = await storage.read(key: "password");
      final result = await userApi.register(
        firstName: firstName!,
        lastName: lastName!,
        phoneNumber: phoneNumber!,
        password: password!,
      );
      if (result != null) {
        _userModel = result;
        _loading = false;
        _sucess = true;
        notifyListeners();
      } else {
        print("=======> ເບີໂທ ແລະ ລະຫັດຜ່ານບໍ່ຖທກຕ້ອງ");
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _sucess = false;
      notifyListeners();
      rethrow;
    }
  }
}

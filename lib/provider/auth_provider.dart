import 'package:course_mobile/model/user_model.dart';

import 'package:course_mobile/service/user_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  
  final auth = FirebaseAuth.instance;
  final userApi = UserAPI();
  var _sucess;
  var _verificationId;
  var _userModel = UserModel();
  var _loading = false;
  UserModel get userModel => _userModel;
  get loading => _loading;
  get verificationId => _verificationId;
  get sucess => _sucess;
  FlutterSecureStorage storage = FlutterSecureStorage(); //

  Future<void> validateToken() async {
    try {
      final token = await storage.read(key: "token");
      final refreshTokens = await storage.read(key: "refreshToken");
      if (token == null ||
          token == "" ||
          refreshTokens == null ||
          refreshTokens == "") {
        _sucess = false;
        notifyListeners();
      } else {
        refreshToken();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refreshToken() async {
    var result = await userApi.refreshToken();
    if (result!.token != null) {
      await storage.delete(key: "token");
      await storage.delete(key: "refreshToken");
      await storage.write(key: "token", value: result.token);
      await storage.write(key: "refreshToken", value: result.refreshToken);
      _sucess = true;
      notifyListeners();
    } else {
      _sucess = false;
      notifyListeners();
    }
  }

  Future<void> verifyOTP({required String otp}) async {
    try {
      if (_verificationId == null || _verificationId == "") {
        _sucess = false;
      } else {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp);
        if (credential.smsCode == otp) {
          print("=======>Ok========");
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
        print("=======>SignInWithPhone========");
        await register();
      } else {
        print("=======>Erorrr========");
        _sucess = false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendOTP() async {
    try {
      _loading = true;
      String? phoneNumber = await storage.read(key: "phoneNumber");
      await auth.verifyPhoneNumber(
        phoneNumber: "+856${phoneNumber}",
        verificationCompleted: (phoneAuthCredential) {
          ///
          _loading = false;
        },
        verificationFailed: (error) {
          _loading = false;
        },
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
      // notifyListeners();
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

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    try {
      final result =
          await userApi.login(phoneNumber: phoneNumber, password: password);

      if (result!.id != null) {
        await storage.delete(key: "token");
        await storage.delete(key: "refreshToken");
        await storage.write(key: "token", value: result.token);
        await storage.write(key: "refreshToken", value: result.refreshToken);
        _loading = false;
        _userModel = result;
        _sucess = true;

        notifyListeners();
      } else {
        _loading = false;
        print("========> Faild");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register() async {
    try {
      _loading = true;
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
      if (result!.id != null) {
        await storage.delete(key: "token");
        await storage.delete(key: "refreshToken");
        await storage.write(key: "token", value: result.token);
        await storage.write(key: "refreshToken", value: result.refreshToken);
        //storeData(result);
        _userModel = result;
        _loading = false;
        _sucess = true;
        notifyListeners();
      } else {
        print("=======> ເບີໂທ ແລະ ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ end");
        _loading = false;
        _sucess = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await storage.delete(key: "token");
      await storage.delete(key: "refreshToken");
      await storage.delete(key: "user");
      _sucess = true;
      notifyListeners();
    } on Exception catch (e) {
      _sucess = false;
      print(e);
      rethrow;
    }
  }

  Future<void> getProfile() async {
    _loading = true;
    try {
      final result = await userApi.getProfile();
      if (result!.id != null) {
         print("=======>Profile: ${result.firstName}");
        _userModel = result;
        _loading = false;
        _sucess = true;
        notifyListeners();
      }
      _loading = false;
      _sucess = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> storeData(data) async {
  //   try {
  //     await storage.delete(key: "user");
  //     await storage.write(key: "user", value: jsonEncode(data));
  //   } on Exception catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }
}

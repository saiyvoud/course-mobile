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
  var _verificationId ;
  var _userModel = UserModel();
  var _loading = false;
  get userModel => _userModel;
  get loading => _loading;
  get verificationId => _verificationId;
  FlutterSecureStorage storage = FlutterSecureStorage(); //

  Future<void> sendOTP() async {
    try {
      String? phoneNumber = await storage.read(key: "phonNumber");
      await auth.verifyPhoneNumber(
        phoneNumber: "+856${phoneNumber}",
        timeout: Duration(seconds: 60),
        verificationCompleted: (phoneAuthCredential) {
          /// 
          print("======> Success");
        },
        verificationFailed: (error){
         print('=====>Error Send OTP${error}');
        }, 
       codeSent: (verificationId,forceResendingToken){
           _verificationId = verificationId ;
           notifyListeners();
       }, 
       codeAutoRetrievalTimeout: (verificationId){
         _verificationId = verificationId;
       },
       );
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
      await storage.write(key: "firstName", value: firstName);
      await storage.write(key: "lastName", value: lastName);
      await storage.write(key: "phoneNumber", value: phoneNumber);
      await storage.write(key: "password", value: password);
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
        // AwesomeDialog(
        //   context: _context!,
        //   dialogType: DialogType.success,
        //   animType: AnimType.rightSlide,
        //   title: 'Dialog Title',
        //   desc: 'Dialog description here.............',
        //   btnCancelOnPress: () {},
        //   btnOkOnPress: () {},
        // )..show();
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

  Future<void> register(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {
    try {
      _loading = true;
      notifyListeners();
      final result = await userApi.register(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          password: password);

      if (result != null) {
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
}

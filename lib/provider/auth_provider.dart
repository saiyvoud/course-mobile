import 'package:course_mobile/model/user_model.dart';
import 'package:course_mobile/router/router.dart';
import 'package:course_mobile/service/user_api.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AuthProvider extends ChangeNotifier {
  final userApi = UserAPI();
  var _userModel = UserModel();
  var _loading = false;
  get userModel => _userModel;
  get loading => _loading;
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
}

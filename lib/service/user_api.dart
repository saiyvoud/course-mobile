import 'dart:convert';

import 'package:course_mobile/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../components/api.dart';

class UserAPI {
  Future<UserModel?> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      Map<String, String> header = {"Accept": "application/json"};
      var body = {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "password": password,
      };
      var response = await http.post(
        Uri.parse("${baseUrl}/user/register"),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        print("=======>${response.body}");
        final UserModel user = UserModel.fromJson(jsonDecode(response.body));
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<UserModel?> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      Map<String, String> header = {"Accept": "application/json"};
      var body = {
        "phoneNumber": phoneNumber,
        "password": password,
      };
      var response = await http.post(
        Uri.parse("${baseUrl}/user/login"),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        print(response.body);
        final UserModel user = UserModel.fromJson(jsonDecode(response.body));
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

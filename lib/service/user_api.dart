import 'dart:convert';

import 'package:course_mobile/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../components/api.dart';

class UserAPI {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<UserModel?> refreshToken() async {
    try {
      Map<String, String> header = {
        "Accept": "application/json",
        "token": "${await storage.read(key: "token")}",
      };
      var body = {
        "token": await storage.read(key: "token"),
        "refreshToken": await storage.read(key: "refreshToken"),
      };
      var response = await http.post(
        Uri.parse("${baseUrl}/user/refreshToken"),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        final UserModel user = UserModel.fromJson(jsonDecode(response.body));
        await storage.delete(key: "token");
        await storage.delete(key: "refreshToken");
        await storage.write(key: "token", value: user.token);
        await storage.write(key: "refreshToken", value: user.refreshToken);
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

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
        await storage.delete(key: "token");
        await storage.delete(key: "refreshToken");
        await storage.write(key: "token", value: user.token);
        await storage.write(key: "refreshToken", value: user.refreshToken);
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
        final UserModel user = UserModel.fromJson(jsonDecode(response.body));
        await storage.delete(key: "token");
        await storage.delete(key: "refreshToken");
        await storage.write(key: "token", value: user.token);
        await storage.write(key: "refreshToken", value: user.refreshToken);
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

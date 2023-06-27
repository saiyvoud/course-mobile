import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../components/api.dart';
import '../model/address_model.dart';

class AddressApi {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Future<AddressModel?> insert({
    required String village,
    required String district,
    required String province,
    required String latitude,
    required String longitude,
  }) async {
    try {
      Map<String, String> header = {
        //"Content-type": "application/json",
        "Accept": "application/json",
        "token": "${await storage.read(key: "token")}",
      };
      var body = {
        "userId": await storage.read(key: "userId"),
        "village": village,
        "district": district,
        "province": province,
        "latitude": latitude,
        "longtitude": longitude,
      };
      var response = await http.post(
        Uri.parse("${baseUrl}/address/insert"),
        body: body,
        headers: header,
      );
      print(response.body);
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        var result = jsonEncode(data['data']);
        final AddressModel address =
            AddressModel.fromJson(jsonDecode(result));
        return address;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<AddressModel?> getByUser({
    required String village,
    required String district,
    required String province,
    required String latitude,
    required String longitude,
  }) async {
    try {
      Map<String, String> header = {
        "Accept": "application/json",
        "token": await storage.read(key: "token").toString()
      };
      var response = await http.get(
        Uri.parse(
            "${baseUrl}/address/getByUser/${await storage.read(key: "userId")}"),
        headers: header,
      );
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        final AddressModel address =
            AddressModel.fromJson(jsonDecode(data['data']));
        return address;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

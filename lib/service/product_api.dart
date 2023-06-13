import 'dart:convert';

import 'package:course_mobile/model/product_model.dart';

import 'package:course_mobile/model/vehicle_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../components/api.dart';
import '../model/banner_model.dart';

class ProductApi {
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future<List<VehicleModel>?> fecthVehicle() async {
    try {
      Map<String, String> header = {
        "Content-type": "application/json",
        "Accept": "application/json",
        "token": "${await storage.read(key: "token")}",
      };
      final response = await http.get(
        Uri.parse("${baseUrl}/vehicle/getAll"),
        headers: header,
      );
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        final vehicle = vehicleModelFromJson(jsonEncode(data['data']));
     
        return vehicle;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<BannerModel>?> fecthBanner() async {
    try {
      Map<String, String> header = {
        "Content-type": "application/json",
        "Accept": "application/json",
        "token": "${await storage.read(key: "token")}",
      };
      final response = await http.get(
        Uri.parse("${baseUrl}/banner/getAll"),
        headers: header,
      );
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        final banner = bannerModelFromJson(jsonEncode(data['data']));
        return banner;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<ProductModel>?> fecthProduct() async {
    try {
      Map<String, String> header = {
        "Content-type": "application/json",
        "Accept": "application/json",
        "token": "${await storage.read(key: "token")}",
      };
      final vehicleId = await storage.read(key: "vehicleId");
       print("=========>${vehicleId}");
      var response = await http.get(
        Uri.parse("${baseUrl}/parts/getByVehicle/${vehicleId}"),
        headers: header,
      );
       print("=========>${response.body}");
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        final product = productModelFromJson(jsonEncode(data['data']));
        return product;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}

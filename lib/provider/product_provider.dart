import 'package:course_mobile/model/banner_model.dart';
import 'package:course_mobile/model/product_model.dart';
import 'package:course_mobile/service/product_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/vehicle_model.dart';

class ProductProvider extends ChangeNotifier {
  final storage = FlutterSecureStorage();
  bool _loading = false;
  bool _productLoading = false;
  bool _success = false;
  final productApi = ProductApi();
  List<ProductModel>? _productList;
  List<BannerModel>? _bannerList;
  List<VehicleModel>? _vehicleList;

  ///
  List<ProductModel>? get productList => _productList;
  List<BannerModel>? get bannerList => _bannerList;
  List<VehicleModel>? get vehicleList => _vehicleList;

  ///
  get loading => _loading;
  get productLoading => _productLoading;
  get success => _success;
  Future<void> fechProductByVehicle({required String vehicleId}) async {
    _productLoading = true;
    await storage.delete(key: "vehicleId");
    await storage.write(key: "vehicleId", value: vehicleId);
    try {
      var result = await productApi.fecthProduct();
      if (result!.length > 0) {
        _productList = result;
        _productLoading = false;
        _success = true;
        notifyListeners();
      }
      _productLoading = false;
      _success = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fecthVehicle() async {
    _loading = true;
    try {
      var result = await productApi.fecthVehicle();
      if (result!.length > 0) {
        await storage.delete(key: "vehicleId");
        await storage.write(key: "vehicleId", value: result[0].id);
        _vehicleList = result;
        _loading = false;
        _success = true;
        notifyListeners();
      }
      _loading = false;
      _success = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fecthProduct() async {
    _productLoading = true;
    notifyListeners();
    try {
      var result = await productApi.fecthProduct();
      if (result!.length > 0) {
        _productList = result;
        _productLoading = false;
        _success = true;
        notifyListeners();
      }
      _productLoading = false;
      _success = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fecthBanner() async {
    _loading = true;
    notifyListeners();
    try {
      var result = await productApi.fecthBanner();
      if (result!.length > 0) {
        _bannerList = result;
        _loading = false;
        _success = true;
        notifyListeners();
      }
      _loading = false;
      _success = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}

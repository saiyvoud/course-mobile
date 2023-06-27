import 'package:course_mobile/model/address_model.dart';
import 'package:course_mobile/service/address_api.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  bool _loading = false;
  bool _success = false;
  AddressModel _address = AddressModel();
  final addressApi = AddressApi();
  AddressModel get address => _address;
  get loading => _loading;
  get success => _success;

  Future<void> insert({
    required String village,
    required String district,
    required String province,
    required String latitude,
    required String longitude,
  }) async {
    _loading = true;
    final result = await addressApi.insert(
      village: village,
      district: district,
      province: province,
      latitude: latitude,
      longitude: longitude,
    );
    print(result);
    if (result!.id != null) {
      _address = result;
      _loading = false;
      _success = true;
      notifyListeners();
    } else {
      _loading = false;
      _success = false;
      notifyListeners();
    }
  }
}

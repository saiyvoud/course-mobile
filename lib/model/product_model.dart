import 'dart:convert';

import 'package:course_mobile/model/vehicle_model.dart';

// import 'package:course_mobile/model/vehicle_model.dart';
List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

class ProductModel {
  final VehicleModel? vehicleModel;
  final String? name;
  final String? detail;
  final int? amount;
  final int? price;
  final String? image;
  final bool? is_Active;

  ProductModel({
    this.name,
    this.vehicleModel,
    this.detail,
    this.amount,
    this.price,
    this.image,
    this.is_Active,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json['name'],
        vehicleModel: VehicleModel.fromJson(json['vehicleId']),
        detail: json['detail'],
        amount: json['amount'],
        price: json['price'],
        image: json['image'],
        is_Active: json['is_Active'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
       // "vehicleId": vehicleModel,
        "detail": detail,
        "amount": amount,
        "price": price,
        "image": image,
        "is_Active": is_Active,
      };
}

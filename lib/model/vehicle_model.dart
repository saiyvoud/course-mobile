import 'dart:convert';

List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(
    json.decode(str).map((x) => VehicleModel.fromJson(x)));

class VehicleModel {
  final String? id;
  final String? name;
  final String? vehicleType;
  final String? image;
  final bool? is_Active;

  VehicleModel({
    this.id,
    this.name,
    this.vehicleType,
    this.image,
    this.is_Active,
  });
  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json['_id'],
        name: json['name'],
        vehicleType: json['vehicleType'],
        image: json['image'],
        is_Active: json['is_Active'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "vehicleType": vehicleType,
        "image": image,
        "is_Active": is_Active,
      };
}

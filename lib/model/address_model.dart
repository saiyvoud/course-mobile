class AddressModel {
  final String? id;
  final String? userId;
  final String? village;
  final String? district;
  final String? province;
  final String? latitude;
  final String? longtitude;

  AddressModel({
    this.id,
    this.userId,
    this.village,
    this.district,
    this.province,
    this.latitude,
    this.longtitude,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['_id'],
        userId: json['userId'],
        village: json['village'],
        district: json['district'],
        province: json['province'],
        latitude: json['latitude'],
        longtitude: json['longtitude'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "village": village,
        "district": district,
        "province": province,
        "latitude": latitude,
        "longtitude": longtitude,
      };
}

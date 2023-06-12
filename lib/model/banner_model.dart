import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

class BannerModel {
  final String? id;
  final String? name;
  final String? detail;
  final String? image;
  //final bool? is_Active;

  BannerModel({
    this.id,
    this.name,
    this.detail,
    this.image,
    //this.is_Active,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['_id'],
        name: json['name'],
        detail: json['detail'],
        image: json['image'],
        //is_Active: json['is_Active'],
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "detail": detail,
        "image": image,
        //"is_Active": is_Active,
      };
}

import 'dart:ffi';

class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profile;
  final String? token;
   final String? refreshToken;
  final Bool? is_Active;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profile,
    this.is_Active,
    this.token,
    this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        profile: json['profile'],
        is_Active: json['is_Active'],
        token: json['token'],
        refreshToken: json['refreshToken']
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "is_Active": is_Active,
        "profile": profile,
        "token": token,
        "refreshToken": refreshToken,
      };
}

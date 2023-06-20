class RefreshTokenModel {
  final String? token;
  final String? refreshToken;

  RefreshTokenModel({
    this.token,
    this.refreshToken,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenModel(
        token: json['token'],
        refreshToken: json['refreshToken'],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
      };
}

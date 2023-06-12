class ResponseApi {
  final bool? status;
  final dynamic message;
  final dynamic data;
  final String? error;

  ResponseApi({
    this.status,
    this.message,
    this.data,
    this.error,
  });
  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
      status: json['status'],
      message: json['message'],
      data: json['data'],
      error: json['error']);
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
        "error": error,
      };
}

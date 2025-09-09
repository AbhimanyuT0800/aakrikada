class SuccessModel {
  final String status;
  final bool data;
  final String message;

  SuccessModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SuccessModel.fromJson(Map<String, dynamic> json) {
    return SuccessModel(
      status: json['status'] ?? '',
      data: json['data'] ?? false,
      message: json['message'] ?? '',
    );
  }
}

class GetDistrictsModel {
  final String status;
  final List<District> data;

  GetDistrictsModel({required this.status, required this.data});

  factory GetDistrictsModel.fromJson(Map<String, dynamic> json) {
    return GetDistrictsModel(
      status: json['status'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => District.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class District {
  final String id;
  final String district;
  final String createdAt;
  final String updatedAt;

  District({
    required this.id,
    required this.district,
    required this.createdAt,
    required this.updatedAt,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'] ?? '',
      district: json['district'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

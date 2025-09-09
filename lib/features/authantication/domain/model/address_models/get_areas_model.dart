class GetAreasModel {
  final String status;
  final List<Area> data;

  GetAreasModel({required this.status, required this.data});

  factory GetAreasModel.fromJson(Map<String, dynamic> json) {
    return GetAreasModel(
      status: json['status'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.map((e) => e.toJson()).toList()};
  }
}

class Area {
  final String id;
  final String districtId;
  final String area;
  final String createdAt;
  final String updatedAt;

  Area({
    required this.id,
    required this.districtId,
    required this.area,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'] ?? '',
      districtId: json['district_id'] ?? '',
      area: json['area'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'district_id': districtId,
      'area': area,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

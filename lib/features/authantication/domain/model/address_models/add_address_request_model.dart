class AddAddressRequestModel {
  final int userId;
  final String address;
  final String area;
  final String town;
  final String district;
  final String lat;
  final String lng;

  AddAddressRequestModel({
    required this.userId,
    required this.address,
    required this.area,
    required this.town,
    required this.district,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "address": address,
      "area": area,
      "town": town,
      "district": district,
      "lat": lat,
      "lng": lng,
    };
  }
}

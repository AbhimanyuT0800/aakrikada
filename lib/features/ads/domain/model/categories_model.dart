class CategoryResponse {
  final String status;
  final List<Category> data;

  CategoryResponse({required this.status, required this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json['status'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => Category.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class Category {
  final String id;
  final String categoryName;
  final String categoryImage;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      categoryName: json['category_name'] ?? '',
      categoryImage: json['category_image'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String image;
  final RatingModel rating;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'] ?? 0, // حط زيرو لو كانت ب نلل
      title: jsonData['title'] ?? 'No Title',
      category: jsonData['category'] ?? 'not found category',

      price: jsonData['price']?.toString() ?? '0.0',
      description: jsonData['description'] ?? 'No Description',
      image: jsonData['image'] ?? 'https://via.placeholder.com/150',
      rating: RatingModel.fromJson(jsonData['rating'] ?? {}),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: jsonData['rate']?.toDouble() ?? 0.0,
      count: jsonData['count'] ?? 0,
    );
  }
}

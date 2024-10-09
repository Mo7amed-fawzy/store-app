class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating; // feets أو التعقيدات والمشكلات علشان اتفادا ال

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      // بستخدم الماب الرجعالي بحط فيها الكيي
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      rating:
          RatingModel.fromJson(jsonData['rating']), // ببعت الماب بتاع تالراتنج
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}

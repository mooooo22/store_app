class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel {
  final String rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic>? json) {
    if (json == null || json['rate'] == null || json['count'] == null) {
      // If json is null or if 'rate' or 'count' is null, return a default RatingModel
      return RatingModel(rate: '0.0', count: 0);
    }
    return RatingModel(
      rate: json['rate'].toString(),
      count: json['count'],
    );
  }
}

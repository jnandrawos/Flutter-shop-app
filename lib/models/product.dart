import 'package:test_app/config/shared_preferences_helper.dart';

class Product {
  int? id;
  String? name;
  num? price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.isFavorite});

  void toggleIsFavourite() {
    isFavorite = !isFavorite;
    isFavorite
        ? SharedPreferencesHelper.addFavoriteProductId(id.toString())
        : SharedPreferencesHelper.removeFavoriteProductId(id.toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'price': price,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      price: json['price'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}

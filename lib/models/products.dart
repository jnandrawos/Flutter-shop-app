import 'package:flutter/material.dart';
import 'package:test_app/config/dio_client.dart';
import 'package:test_app/config/shared_preferences_helper.dart';
import 'package:test_app/models/product.dart';

class Products extends ChangeNotifier {
  List<Product?> productsList = [];
  Future<void> getSavedProducts() async {
    productsList.clear();
    var dioClient = DioClient();
    productsList = await dioClient.getProducts();

    List<String> favoriteProductIds =
        await SharedPreferencesHelper.getFavouriteProductIds();

    for (var productId in favoriteProductIds) {
      var product = productsList.firstWhere(
        (element) => element?.id.toString() == productId,
      );
      product?.isFavorite = true;
    }

    notifyListeners();
  }

  void toggleProductIsFavourite(int id) {
    productsList
        .firstWhere((element) => element?.id == id)
        ?.toggleIsFavourite();

    notifyListeners();
  }

  void clearList() {
    productsList.clear();
    notifyListeners();
  }
}

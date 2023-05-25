import 'package:flutter/material.dart';
import 'package:test_app/config/shared_preferences_helper.dart';
import 'package:test_app/models/product.dart';

class Cart extends ChangeNotifier {
  num total = 0;
  List<Product?> cartItems = [];

  getSavedCart() async {
    cartItems = await SharedPreferencesHelper.getCartItems();
    notifyListeners();
  }

  Future<bool> addToCart(Product? product) async {
    cartItems.add(product);
    notifyListeners();
    return await SharedPreferencesHelper.saveCartItems(cartItems);
  }

  Future<bool> removeFromCart(Product? product) async {
    int indexToRemove =
        cartItems.indexWhere((element) => element?.id == product?.id);
    if (indexToRemove != -1) {
      cartItems.removeAt(indexToRemove);
    }
    notifyListeners();
    return await SharedPreferencesHelper.saveCartItems(cartItems);
  }
}

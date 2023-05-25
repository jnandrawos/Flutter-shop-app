import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';

class SharedPreferencesHelper {
  static const String _kfavoriteProductKey = 'favoriteproductskey';
  static const String _kCartItemsKey = 'cartitemskey';

  static Future<bool> addFavoriteProductId(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var oldIds = await getFavouriteProductIds();
    oldIds.add(productId);
    return await prefs.setStringList(_kfavoriteProductKey, oldIds);
  }

  static Future<bool> removeFavoriteProductId(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var oldIds = await getFavouriteProductIds();
    oldIds.remove(productId);
    return await prefs.setStringList(_kfavoriteProductKey, oldIds);
  }

  static Future<List<String>> getFavouriteProductIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? productStrings =
        prefs.getStringList(_kfavoriteProductKey);
    if (productStrings != null) {
      return productStrings;
    }
    return [];
  }

  static Future<bool> saveCartItems(List<Product?> cartItems) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var cartStringList =
        cartItems.map((item) => json.encode(item?.toJson())).toList();
    return await prefs.setStringList(_kCartItemsKey, cartStringList);
  }

  static Future<List<Product?>> getCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? productStrings = prefs.getStringList(_kCartItemsKey);
    if (productStrings != null) {
      return productStrings.map((productString) {
        final Map<String, dynamic> json = jsonDecode(productString);
        return Product?.fromJson(json);
      }).toList();
    }
    return [];
  }
}

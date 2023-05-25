import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/product.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product?>> getProducts() async {
    Response data = await _dio.get('$_baseUrl/products');

    if (kDebugMode) {
      print('User Info: $data');
    }

    List<dynamic> jsonData = data.data;

    List<Product?> productList =
        jsonData.map((json) => Product.fromJson(json)).toList();

    return productList;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/products.dart';

import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  const WishlistScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    var productsProvier = Provider.of<Products>(context);
    var productList = List.empty() +
        productsProvier.productsList
            .where((element) => element?.isFavorite == true)
            .toList();
    return Scaffold(
        appBar: const CustomAppBar(title: 'Wishlist'),
        body: Center(
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductListTile(
                product: productList[index],
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomNavBar());
  }
}

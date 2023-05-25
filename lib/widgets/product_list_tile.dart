import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/models/products.dart';

import '../models/cart.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    var productsProvier = Provider.of<Products>(context);
    var cartProvider = Provider.of<Cart>(context);
    return ListTile(
      title: Text(product?.name ?? ''),
      subtitle: Text(product?.price.toString() ?? ''),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                product?.isFavorite ?? false
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                productsProvier.toggleProductIsFavourite(product?.id ?? -1);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 500),
                    content: Text(
                      product?.isFavorite ?? false
                          ? 'Product added to favorites'
                          : 'Product removed from favorites',
                      textAlign: TextAlign.center,
                    )));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                cartProvider.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text(
                      'Product added to cart',
                      textAlign: TextAlign.center,
                    )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

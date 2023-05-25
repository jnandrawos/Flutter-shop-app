import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/product.dart';

import '../models/cart.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({super.key, required this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);
    return ListTile(
      title: Text(product?.name ?? ''),
      subtitle: Text(product?.price.toString() ?? ''),
      trailing: SizedBox(
        width: 105,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
              onPressed: () {
                cartProvider.removeFromCart(product);
              },
            ),
            Text((cartProvider.cartItems
                    .where((element) => element?.id == product?.id))
                .length
                .toString()),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                cartProvider.addToCart(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}

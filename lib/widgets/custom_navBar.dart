import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../screens/screens.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
            icon: const Icon(Icons.home),
            color: Colors.white,
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, CartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartProvider.cartItems.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

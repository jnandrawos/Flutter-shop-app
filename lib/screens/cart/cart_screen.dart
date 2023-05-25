import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widgets/cart_list_tile.dart';

import '../../models/cart.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartItems = Provider.of<Cart>(context).cartItems;
    return Scaffold(
        appBar: const CustomAppBar(title: 'Cart'),
        body: cartItems.isEmpty
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Cart is empty. Add some items!',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ]),
              )
            : ListView.builder(
                itemCount: cartItems.toSet().length,
                itemBuilder: (BuildContext context, int index) {
                  return CartListTile(
                    product: cartItems.toSet().toList()[index],
                  );
                },
              ),
        bottomNavigationBar: const CustomNavBar());
  }
}

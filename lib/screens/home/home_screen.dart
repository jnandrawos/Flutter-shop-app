import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/products.dart';

import '../../models/cart.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    _initializeData();
    super.didChangeDependencies();
  }

  _initializeData() async {
    if (!_isInitialized) {
      await Provider.of<Products>(context, listen: false).getSavedProducts();
      await Provider.of<Cart>(context, listen: false).getSavedCart();
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var productsProvier = Provider.of<Products>(context);
    var productList = productsProvier.productsList;

    return Scaffold(
        appBar: const CustomAppBar(title: 'eCommerce App'),
        body: RefreshIndicator(
          color: Colors.black,
          onRefresh: () async {
            productsProvier.clearList();
            await productsProvier.getSavedProducts();
          },
          child: Center(
            child: productList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting result...'),
                        ),
                      ])
                : ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductListTile(
                        product: productList[index],
                      );
                    },
                  ),
          ),
        ),
        bottomNavigationBar: const CustomNavBar());
  }
}

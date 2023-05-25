import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/config/app_router.dart';
import 'package:test_app/config/theme.dart';
import 'package:test_app/models/products.dart';

import 'models/cart.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Products(),
          ),
          ChangeNotifierProvider(
            create: (_) => Cart(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'eCommerce App',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ));
  }
}

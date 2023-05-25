import 'package:flutter/material.dart';
import 'package:test_app/screens/screens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WishlistScreen.routeName);
            },
            icon: const Icon(Icons.favorite))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

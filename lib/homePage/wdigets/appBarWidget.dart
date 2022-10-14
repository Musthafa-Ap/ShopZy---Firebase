import 'package:flutter/material.dart';

import 'blackIconButton.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "ShopZy",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: [
        BlackIconButton(
          icon: Icons.search,
          pressFunction: () {
            print("hie");
          },
        ),
        BlackIconButton(
          icon: Icons.favorite_outline,
          pressFunction: () {},
        ),
        BlackIconButton(
          icon: Icons.shopping_bag_outlined,
          pressFunction: () {},
        )
      ],
    );
  }
}

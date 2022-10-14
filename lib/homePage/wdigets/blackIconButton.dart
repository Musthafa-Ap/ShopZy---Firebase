import 'package:flutter/material.dart';

class BlackIconButton extends StatelessWidget {
  BlackIconButton({Key? key, required this.icon, required this.pressFunction})
      : super(key: key);
  final IconData icon;
  void Function() pressFunction;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: pressFunction,
        icon: Icon(
          icon,
          color: Colors.black,
        ));
  }
}

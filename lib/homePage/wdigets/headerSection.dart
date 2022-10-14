import 'package:flutter/material.dart';

import 'blackIconButton.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(children: [
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Row(
              children: [
                const Text(
                  "Cloths",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const Spacer(),
                BlackIconButton(
                  icon: Icons.keyboard_arrow_down,
                  pressFunction: () {},
                )
              ],
            ),
          ),
        ),
        BlackIconButton(
          icon: Icons.sort,
          pressFunction: () {},
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class CatagorySection extends StatefulWidget {
  CatagorySection({super.key});

  @override
  State<CatagorySection> createState() => _CatagorySectionState();
}

class _CatagorySectionState extends State<CatagorySection> {
  final _catagories = ["Ladies", "Gents", "Kids", "Boys", "Girls"];
  ValueNotifier<int> indexNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _catagories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                indexNotifier.value = index;
              },
              child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: ValueListenableBuilder(
                    valueListenable: indexNotifier,
                    builder: (context, newIndex, child) {
                      return Container(
                        width: 75,
                        decoration: BoxDecoration(
                            color:
                                index == newIndex ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 12),
                          child: Text(
                            _catagories[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: index == newIndex
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            );
          }),
    );
  }
}

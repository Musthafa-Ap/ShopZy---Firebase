import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final DocumentSnapshot item;
  const ImageCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item["img"],
              height: 230,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 3,
            top: 3,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(31, 122, 119, 119),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            item["name"],
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Rs ${item["price"]}",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

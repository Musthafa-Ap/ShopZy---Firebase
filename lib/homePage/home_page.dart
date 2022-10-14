import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/homePage/wdigets/catagorySection.dart';
import 'package:firebase/homePage/wdigets/drawer.dart';
import 'package:firebase/homePage/wdigets/headerSection.dart';
import 'package:flutter/material.dart';
import 'wdigets/appBarWidget.dart';
import 'wdigets/imageCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBarWidget(),
        ),
        body: Column(
          children: [
            const HeaderSection(),
            CatagorySection(),
            Expanded(
              child: MainBodyWidget(),
            ),
          ],
        ));
  }
}

class MainBodyWidget extends StatelessWidget {
  MainBodyWidget({super.key});
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _products.snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5),
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return ImageCard(
                    item: documentSnapshot,
                  );
                });
          }
        } else {
          return const Center(
            child: SizedBox(),
          );
        }
      },
    );
  }
}

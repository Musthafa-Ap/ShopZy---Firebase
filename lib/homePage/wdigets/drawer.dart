import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
              ),
              accountName: Text(
                "Welcome Musthafa AP",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              accountEmail: Text(
                "Musthafamhammed398@gmail.com",
                style: TextStyle(color: Colors.black),
              )),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

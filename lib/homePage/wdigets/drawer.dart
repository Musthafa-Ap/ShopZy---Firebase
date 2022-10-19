import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
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
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://media-exp1.licdn.com/dms/image/C5603AQFwS8Z7hBAx1g/profile-displayphoto-shrink_800_800/0/1664164093774?e=1671667200&v=beta&t=2g92_s3drqxgthlk3a9Y58_AjiXr26EaNVmMUeUGa1g"),
              ),
              accountName: Text(
                "Welcome Musthafa AP",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              accountEmail: Text(
                "Musthafamhammed398@gmail.com",
                style: TextStyle(color: Colors.black),
              )),
          const ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            title: Text("My Orders"),
            leading: Icon(
              Icons.shopping_bag,
            ),
          ),
          const ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            title: Text("My Wishlist"),
            leading: Icon(
              Icons.favorite,
            ),
          ),
          const ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            title: Text("My Address"),
            leading: Icon(
              Icons.location_city,
            ),
          ),
          const ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            title: Text("My Wallet"),
            leading: Icon(
              Icons.wallet,
            ),
          ),
          const ListTile(
            iconColor: Colors.black,
            textColor: Colors.black,
            title: Text("Help Center"),
            leading: Icon(
              Icons.help,
            ),
          ),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            title: const Text(
              "Sign out",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

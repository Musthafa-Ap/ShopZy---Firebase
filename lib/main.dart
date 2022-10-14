import 'package:firebase/homePage/home_page.dart';
import 'package:firebase/authentication/login_widget.dart';
import 'package:firebase/authentication/utils.dart';
import 'package:firebase/authentication/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'authentication/auth_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainPage());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MainPage extends StatelessWidget {
  static final String title = 'Setup Firebase';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return VerifyEmail();
                  } else {
                    return AuthPage();
                  }
                })));
  }
}

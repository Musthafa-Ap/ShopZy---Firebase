import 'dart:async';
import 'package:firebase/homePage/home_page.dart';
import 'package:firebase/authentication/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  bool canResendEmail = false;
  bool isEmailVerified = false;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? HomePage()
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("Verify email"),
              backgroundColor: Colors.black,
            ),
            body: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(
                  height: 100,
                ),
                Text("A verification email has been sent to your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15)),
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.purple,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  onPressed: () {
                    canResendEmail ? sendVerificationEmail() : null;
                  },
                  label: Text(
                    "Recent email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    Icons.email_outlined,
                    size: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15)),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.purple,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    onPressed: () async {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            ),
          );
  }
}

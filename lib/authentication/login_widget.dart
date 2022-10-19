import 'package:email_validator/email_validator.dart';
import 'package:firebase/authentication/forgot_password.dart';
import 'package:firebase/authentication/utils.dart';
import 'package:firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  Function onClickedSignUp;
  LoginWidget({super.key, required this.onClickedSignUp});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _globalKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _globalKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            CircleAvatar(
                backgroundColor: Colors.black,
                radius: 150,
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/b/fashion-shopping-girl-portrait-yellow-background-fashion-shopping-girl-portrait-yellow-background-shopping-concept-186389830.jpg")),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Email"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? "Enter a valid mail"
                      : null,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Password"),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
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
                  SignIn();
                },
                child: Text(
                  "Log in",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: GestureDetector(
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPassword()));
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    text: 'No account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              widget.onClickedSignUp as GestureTapCallback?,
                        text: 'Sign up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void SignIn() async {
    final isValid = _globalKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

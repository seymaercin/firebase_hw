
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_hw/view/register_page.dart';
import 'package:firebase_hw/view_model/main_view_model.dart';
import 'package:firebase_hw/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/main_page.dart';

class LoginViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: RegisterPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _openMainPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: const MainPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}

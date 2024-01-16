
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_hw/view/login_page.dart';
import 'package:firebase_hw/view/main_page.dart';
import 'package:firebase_hw/view_model/login_view_model.dart';
import 'package:firebase_hw/view_model/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void register(BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
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

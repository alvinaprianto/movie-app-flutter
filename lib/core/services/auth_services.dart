import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/pages/login_page.dart';
import 'package:movie_app/core/pages/main_page.dart';

class AuthServices {
  static void registerFirebase(
      BuildContext context, String email, String password) async {
    try {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  static void signOutFirebase(BuildContext context) async {
    try {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  static void signInFirebase(
      BuildContext context, String email, String password) async {
    try {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}

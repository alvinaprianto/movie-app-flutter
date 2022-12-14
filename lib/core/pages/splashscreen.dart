import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/pages/login_page.dart';
import 'package:movie_app/core/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.push(
              context, MaterialPageRoute(builder: ((context) => MainPage())))
          : Navigator.push(
              context, MaterialPageRoute(builder: ((context) => LoginPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/splashscreen.png',
          height: 100,
        ),
      ),
    );
  }
}

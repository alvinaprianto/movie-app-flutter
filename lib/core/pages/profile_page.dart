import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/core/services/auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                    Text(FirebaseAuth.instance.currentUser!.email!.toString()),
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthServices.signOutFirebase(this.context);
                  },
                  child: Container(
                    color: Colors.blue,
                    child: Text("Sign out"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

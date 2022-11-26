import 'package:final_project/Authenticate/login.dart';
import 'package:final_project/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return MyHomePage(title: '',);
    } else {
      return LoginPage();
    }
  }
}
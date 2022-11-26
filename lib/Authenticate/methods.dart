import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Authenticate/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> buatAkun(String nama, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");

    userCrendetial.user!.updateDisplayName(nama);
    await _firestore.collection('user_details').doc(_auth.currentUser!.uid).set(
      {
        "nama": nama,
        "email": email,
        "status": "Unavalible",
        "uid": _auth.currentUser!.uid,
      },
    );
    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore
        .collection('user_details')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['nama']));

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LoginPage(),
        ),
      );
    });
  } catch (e) {
    print("error");
  }
}

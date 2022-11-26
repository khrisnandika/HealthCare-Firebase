import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Chat/models/UIHelper.dart';
import 'package:final_project/Chat/models/UserModel.dart';
import 'package:final_project/Chat/pages/HomePage.dart';
import 'package:final_project/ChatRoom.dart/chat.dart';
import 'package:final_project/Profile/akun.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/dashboard.dart';
import 'package:final_project/global.dart';
import 'package:final_project/list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final global = Global();
  List Pindah = [
    Dashboard(),
    LihatSemua(),
    // PesanChat(),
    HomePage(userModel: UserModel()),
    // HomePage(userModel: UserModel()),
    AkunProfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Pindah[global.index],
      bottomNavigationBar: Container(
        // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
        // height: double.infinity,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            selectedIndex: global.index,
            backgroundColor: kWhiteColor,
            // color: Colors.white,
            color: kTitleTextColor,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff0ab885),
            gap: 8,
            onTabChange: (i) {
              setState(() {
                global.index = i;
              });
            },
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.dashboard_outlined,
                text: 'Beranda',
              ),
              GButton(
                icon: Icons.list_alt_rounded,
                text: 'Tenaga Medis',
              ),
              GButton(
                icon: Icons.chat_bubble_outline,
                text: 'Pesan',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

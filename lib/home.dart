import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:final_project/akun.dart';
import 'package:final_project/ChatRoom.dart/chat.dart';
import 'package:final_project/Components/category_card.dart';
import 'package:final_project/Components/perawat_card.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/daftar_tmedis.dart';
import 'package:final_project/dashboard.dart';
import 'package:final_project/detail_informasi.dart';
import 'package:final_project/global.dart';
import 'package:final_project/list.dart';

import 'Components/search_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final global=Global();
  List Pindah=[Dashboard(), LihatSemua(), PesanChat(), AkunProfil()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Pindah[global.index],
      
      bottomNavigationBar: Container(
        color: Color(0xff17262b),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            selectedIndex: global.index,

            backgroundColor: Color(0xff17262b),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff0ab885),
            gap: 8,

            onTabChange: (i) {
              setState(() {
                global.index=i;
              });
            },
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.list,
                text: 'List',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profiile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

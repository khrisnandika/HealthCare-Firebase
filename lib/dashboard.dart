import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Components/category_card.dart';
import 'package:final_project/Components/layanan_card.dart';
import 'package:final_project/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('user_details')
        .where('uid', isEqualTo: user?.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       SvgPicture.asset('assets/icons/menu.svg'),
            //       SvgPicture.asset('assets/icons/profile.svg'),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Hi, ",
                      style: GoogleFonts.montserrat(
                        color: kTitleTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: user!.displayName!,
                      style: GoogleFonts.montserrat(
                        color: kTitleTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Temukan Perawat\nyang Anda Inginkan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: kTitleTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   child: SearchBar(),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Informasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTitleTextColor,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildCategoryList(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Layanan Kami',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTitleTextColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildLayananList(),
          ],
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Gigi',
            'assets/icons/dental_surgeon.png',
            kBlueColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Jantung',
            'assets/icons/heart_surgeon.png',
            kYellowColor,
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Mata',
            'assets/icons/eye_specialist.png',
            kOrangeColor,
          ),
          SizedBox(
            width: 30,
          ),
          // CategoryCard(
          //   'Tulang',
          //   'icons/eye_specialist.png',
          //   kOrangeColor,
          // ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  buildLayananList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          LayananCard('Layanan \nPerawat', 'assets/image/perawat.png'),
          SizedBox(
            width: 20,
          ),
          LayananCard('Layanan \nBidan', 'assets/image/bidan.png')
        ],
      ),
    );
  }
}

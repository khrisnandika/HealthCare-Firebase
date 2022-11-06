import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/edit_akun.dart';
import 'package:final_project/global.dart';
import 'package:final_project/login.dart';
import 'package:final_project/setting.dart';

class AkunProfil extends StatefulWidget {
  @override
  State<AkunProfil> createState() => _AkunProfilState();
}

class _AkunProfilState extends State<AkunProfil> {
  final global = Global();
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kHealthCareColor,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/image/avatar.png',
                      ),
                      radius: 70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Krisna Choiril Andika',
              style: TextStyle(
                color: kTitleTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('khrisnandika@gmail.com'),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAkun(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Edit'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  width: 450,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kGreyColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Image(
                              image: AssetImage(
                                'assets/icons/setting.png',
                              ),
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Setting',
                            style: GoogleFonts.montserrat(
                                color: kTitleTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 450,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: () {
                        _signOut().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kGreyColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Image(
                              image: AssetImage(
                                'assets/icons/logout.png',
                              ),
                              width: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Logout',
                            style: GoogleFonts.montserrat(
                                color: kTitleTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

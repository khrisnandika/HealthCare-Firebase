import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/akun.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/edit_akun.dart';
import 'package:final_project/global.dart';

class SettingScreen extends StatelessWidget {
  final global = Global();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AkunProfil(),
                          ));
                    },
                    child: Image(
                      image: AssetImage(
                        'assets/icons/back2.png',
                      ),
                      width: 13,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    "Ubah Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTitleTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Awal',
                  hintText: 'Password Awal',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  hintText: 'Password Baru',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password Baru',
                  hintText: 'Konfirmasi Password Baru',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            new SizedBox(
              height: 50,
              width: 380,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

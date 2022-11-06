import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/akun.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/edit_akun.dart';
import 'package:final_project/global.dart';

class EditAkun extends StatelessWidget {
  final global = Global();
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
                    width: 120,
                  ),
                  Text(
                    "Profile",
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
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                        ),
                        backgroundColor: kHealthCareColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kHealthCareColor,
                    ),
                  ),
                  labelText: 'Nama Lengkap',
                  hintText: 'masukkan nama lengkap anda',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kHealthCareColor,
                    ),
                  ),
                  labelText: 'Email',
                  hintText: 'masukkan nama lengkap anda',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: kHealthCareColor,
                    ),
                  ),
                  labelText: 'Alamat',
                  hintText: 'masukkan nama lengkap anda',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

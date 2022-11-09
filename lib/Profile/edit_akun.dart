import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Profile/akun.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/global.dart';

class EditAkun extends StatefulWidget {
  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  final global = Global();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _namaController = TextEditingController();

  String alamat = '';

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('user_details')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      alamat = result.docs[0]['alamat'];
    });
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
                        onPressed: () {
                          
                        },
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
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                controller: _namaController,
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
                  // labelText: 'Nama Lengkap',
                  // labelStyle: GoogleFonts.montserrat(
                  //   color: kHealthCareColor,
                  //   fontSize: 14
                  // ),
                  hintText: user!.displayName!,
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 14
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
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
                  // labelText: 'Email',
                  // labelStyle: GoogleFonts.montserrat(
                  //   color: kHealthCareColor,
                  //   fontSize: 14
                  // ),
                  hintText: user!.email!,
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 14
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
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
                  labelStyle: GoogleFonts.montserrat(
                    color: kHealthCareColor,
                    fontSize: 14
                  ),
                  hintText: 'masukkan alamat lengkap anda',
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 14
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              height: 50,
              width: 325,
              child: ElevatedButton(
                onPressed: () {
                  user?.updateDisplayName(_namaController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Simpan',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:final_project/components/category_card.dart';
import 'package:final_project/components/perawat_card.dart';
import 'package:final_project/components/search_bar.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/dashboard.dart';
import 'package:final_project/global.dart';
import 'package:final_project/home.dart';

class LihatSemua extends StatelessWidget {
  // const LihatSemua({super.key});

  final global=Global();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       BackButton(
              //         onPressed: () {
              //           // global.index=0;
              //           Navigator.of(context).pop(MaterialPageRoute(
              //               builder: (context) => Dashboard()));
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kHealthCareColor.withOpacity(0.7),
                      ),
                      child: Text(
                        'Semua',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kHealthCareColor.withOpacity(0.7),
                      ),
                      child: Text(
                        'Perawat',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kHealthCareColor.withOpacity(0.7),
                      ),
                      child: Text(
                        'Bidan',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildPerawatList(),
            ],
          ),
        ),
      ),
    );
  }

  buildPerawatList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          PerawatCard(
            'Intan Sulistyaningrum Sakkinah',
            'Perawat \nSTR 351212121212',
            'assets/image/doctor1.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          PerawatCard(
            'Krisna Choiril Andika',
            'Perawat \nSTR 351212121212',
            'assets/image/doctor2.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          PerawatCard(
            'Mickey',
            'Perawat \nSTR 351212121212',
            'assets/image/doctor3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

import 'package:final_project/static.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Widget/category_card.dart';
import 'package:final_project/Widget/perawat_card.dart';
import 'package:final_project/Widget/search_bar.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/dashboard.dart';
import 'package:final_project/global.dart';
import 'package:final_project/home.dart';

class LihatSemua extends StatefulWidget {
  @override
  State<LihatSemua> createState() => _LihatSemuaState();
}

class _LihatSemuaState extends State<LihatSemua> {
  // const LihatSemua({super.key});
  final global = Global();
  List perawatku = [];

  String itemSelected = "";

  @override
  void initState() {
    perawatku = perawats;
    super.initState();
  }

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
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 24,
                ),
                child: SearchBar(),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ListView.builder(
                  itemCount: button.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          itemSelected = button[index]['name'];
                          perawatku = perawats
                              .where((element) =>
                                  element['status'] == itemSelected)
                              .toList();
                              print(perawatku);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: itemSelected == button[index]['name']
                              ? kHealthCareColor.withOpacity(0.7)
                              : null,
                          border: Border.all(
                            color: kHealthCareColor.withOpacity(0.7),
                          ),
                        ),
                        child: Text(
                          button[index]['name'],
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: itemSelected == button[index]['name']
                                ? kWhiteColor
                                : kHealthCareColor.withOpacity(0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Padding(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 5,
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 10,
              //           vertical: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: kHealthCareColor.withOpacity(0.7),
              //         ),
              //         child: Text(
              //           'Semua',
              //           style: TextStyle(
              //             // fontWeight: FontWeight.bold,
              //             color: kWhiteColor,
              //             fontSize: 15,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       Container(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 10,
              //           vertical: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: kHealthCareColor.withOpacity(0.7),
              //         ),
              //         child: Text(
              //           'Perawat',
              //           style: TextStyle(
              //             // fontWeight: FontWeight.bold,
              //             color: kWhiteColor,
              //             fontSize: 15,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       Container(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 10,
              //           vertical: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: kHealthCareColor.withOpacity(0.7),
              //         ),
              //         child: Text(
              //           'Bidan',
              //           style: TextStyle(
              //             // fontWeight: FontWeight.bold,
              //             color: kWhiteColor,
              //             fontSize: 15,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
      child: ListView.builder(
        itemCount: perawatku.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 14,
            ),
            child: PerawatCard(
              perawatku[index]['name'],
              'Perawat \nSTR ${perawatku[index]['str']}',
              perawatku[index]['image'],
              perawatku[index]['color'],
            ),
          );
        },
      ),
      // child: Column(
      //   children: <Widget>[
      //     PerawatCard(
      //       'Asep',
      //       'Perawat \nSTR 351212121212',
      //       'assets/image/doctor1.png',
      //       kBlueColor,
      //     ),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     PerawatCard(
      //       'Krisna Choiril Andika',
      //       'Perawat \nSTR 351212121212',
      //       'assets/image/doctor2.png',
      //       kYellowColor,
      //     ),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     PerawatCard(
      //       'Mickey',
      //       'Perawat \nSTR 351212121212',
      //       'assets/image/doctor3.png',
      //       kOrangeColor,
      //     ),
      //     SizedBox(
      //       height: 20,
      //     ),
      //   ],
      // ),
    );
  }
}

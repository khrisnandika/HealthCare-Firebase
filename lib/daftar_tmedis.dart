import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Components/perawat_card.dart';
import 'package:final_project/Components/search_bar.dart';
import 'package:final_project/constant.dart';

void main() {
  runApp(const DaftarMedis());
}

class DaftarMedis extends StatelessWidget {
  const DaftarMedis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item
  List<String> items = [
    "Perawat",
    "Bidan",
  ];


  /// List of body icon
  // List<IconData> icons = [
  //   Icons.home,
  //   Icons.explore,
  //   Icons.search,
  //   Icons.feed,
  //   Icons.post_add,
  //   Icons.local_activity,
  //   Icons.settings,
  //   Icons.person
  // ];


  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // APPBAR
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.deepPurpleAccent,
      //   title: Text(
      //     "Custom TabBar",
      //     style: GoogleFonts.laila(
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        bottom: false, 
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                child: SearchBar(),
              ),
              SizedBox(
                height: 10,
              ),
              /// CUSTOM TABBAR
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 80,
                              height: 45,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? kHealthCareColor
                                    : kHealthCareColor.withOpacity(0.7),
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                // border: current == index
                                //     ? Border.all(
                                //         color: Colors.black,
                                //         width: 2,
                                //       )
                                //     : null,
                              ),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: GoogleFonts.laila(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.white
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: current == index,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: kHealthCareColor,
                                  shape: BoxShape.circle,
                                ),
                              ))
                        ],
                      );
                    }),
              ),
      
              /// MAIN BODY
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildPerawatList(),
                    // Icon(
                    //   icons[current],
                    //   size: 200,
                    //   color: Colors.deepPurple,
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      items[current],
                      style: GoogleFonts.laila(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/constant.dart';
import 'package:final_project/detail_chat.dart';
import 'package:final_project/global.dart';
import 'package:get/get.dart';
import 'package:final_project/search_chat.dart';

class PesanChat extends StatelessWidget {
  final global = Global();
  final List<Widget> myChat = List.generate(
    20,
    (index) => ListTile(
      onTap: () {
        
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black26,
        child: Image(
          image: AssetImage('assets/image/avatar.png'),
        ),
      ),
      title: Text(
        "Perawat ke ${index + 1}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "Status perawat ke ${index + 1}",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
      trailing: Chip(
        label: Text(
          '2',
        ),
      ),
    ),
  ).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              color: kHealthCareColor,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat',
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kBackgroundColor,
                    ),
                  ),
                  Material(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: kHealthCareColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: myChat.length,
              itemBuilder: (context, index) => myChat[index],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView(),));
        },
        child: Icon(Icons.search),
        backgroundColor: kHealthCareColor,
      ),
    );
  }
}

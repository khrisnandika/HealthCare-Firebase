import 'package:flutter/material.dart';
import 'package:final_project/constant.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: kHealthCareColor,
          title: Text('Cari'),
          centerTitle: true,
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                cursorColor: kHealthCareColor,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  fillColor: kBackgroundColor,
                  filled: true,
                  hintText: "Cari",
                  suffixIcon: InkWell(
                    borderRadius: new BorderRadius.circular(50),
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: kHealthCareColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(130),
      ),
    );
  }
}

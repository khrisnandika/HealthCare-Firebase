import 'package:flutter/material.dart';
import 'package:final_project/constant.dart';

class LayananCard extends StatelessWidget {
  var _title;
  var _imageUrl;

  LayananCard(this._title, this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 40,
      decoration: BoxDecoration(
        color: kHealthCareColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Text(
              _title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80, top: 8),
            child: Image.asset('assets/image/bg_shape.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: 160, top: 10),
            child: Image.asset(
              _imageUrl,
            ),
          ),
        ],
      ),
    );
  }
}

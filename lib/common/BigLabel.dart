import 'package:flutter/material.dart';
import 'package:bloc_pattern_demo/resources/LatoBold.dart';

import '../resources/LatoBold.dart';


class BigLabel extends StatelessWidget {

  final String title;
  final TextAlign textAlign;

  BigLabel({required this.title,this.textAlign=TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign:textAlign,
      style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontFamily: fontslatobold.appFontlatobold,
           fontWeight: FontWeight.normal
      ),
    );
  }
}

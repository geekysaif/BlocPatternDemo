import 'package:flutter/material.dart';
import 'package:bloc_pattern_demo/resources/LatoRegular.dart';


class ErrorLabel extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;

  ErrorLabel(
      {required this.title,
        this.color = Colors.red,
        this.fontSize = 14,
        required this.maxLines,
        this.overflow=TextOverflow.visible,
        this.fontWeight = FontWeight.normal,
        this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle parent = DefaultTextStyle.of(context);
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines ?? parent.maxLines,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: fontslatoregular.appFontlatoregular,
          fontWeight: fontWeight),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bloc_pattern_demo/resources/Barlowfonts.dart';
import 'package:bloc_pattern_demo/resources/gradients.dart';

class Button extends StatefulWidget {

  final String title;
  final GestureTapCallback onTap;
  final bool enabled;
  final double width;
  final LinearGradient gradient;

  @override
  _ButtonState createState() => _ButtonState();

  Button({
    required this.enabled,
    required this.onTap,
    required this.title,
    required this.width,
    required this.gradient
  });

}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap:widget.onTap,
      child: new Container(
        height: 44.0,
        width:widget.width!=null?widget.width:MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25.0),
          gradient:widget.gradient!=null?widget.gradient:appGradient.green(),
//          boxShadow: [
//            new BoxShadow(
//              color: Color(CommonMethods.getColorHexFromStr(AppColors().grey000029)),
//              blurRadius: 3,
//              offset: new Offset(0.0, 1.0),
//            )
//          ],
        ),
        child: new Center(
          child: new Text(
            widget.title.toUpperCase(),
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: fonts.appFont,
                fontWeight: FontWeight.w700),
          ),
        ),
        // Add box decoration
      ),
    );
  }
}

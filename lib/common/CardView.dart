import 'package:flutter/material.dart';

class CardView extends StatelessWidget {

  final Widget child;
  final Color color;

  CardView({required this.child,this.color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 12,right: 12),
      child: Card(
          color: color,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child:child
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedView extends StatefulWidget {
  final Widget child;
  @override
  _AnimatedViewState createState() => _AnimatedViewState();

  AnimatedView({required this.child});
}

class _AnimatedViewState extends State<AnimatedView> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    offset = Tween<Offset>(begin: Offset(0.0, 0.5), end: Offset.zero).animate(controller);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: offset,
        child:widget.child);
  }
}

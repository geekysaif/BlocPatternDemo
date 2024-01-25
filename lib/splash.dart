import 'package:bloc_pattern_demo/walkthrough.dart';
import 'package:flutter/material.dart';
import 'common/Constants.dart';
import 'common/shared_preference.dart';
import 'resources/images.dart';
import 'dart:async';
import 'package:bloc_pattern_demo/resources/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static SplashState of(BuildContext context) {
    return SplashState();
  }

  @override
  void initState() {
    super.initState();
    loadWidget();
  }

  @override
  Widget build(BuildContext context)
      {
    return Scaffold(
              backgroundColor: Color(appColors.yellow),
              body: Container(
                constraints: const BoxConstraints.expand(),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(appImages.splashImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ));
       }

  /*Navigate after delay*/
  navigateScreen() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WalkThrough()));
  }

  loadWidget() {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {

        navigateScreen();
    });
  }

}

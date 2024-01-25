import 'package:bloc_pattern_demo/resources/LatoRegular.dart';
import 'package:bloc_pattern_demo/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:bloc_pattern_demo/resources/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApplication());
}

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {


  @override
  void initState() {
    super.initState();

  }


  // Main initialization
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return OverlaySupport.global(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // Define the default brightness and colors.
            primaryColor: Color(appColors.white),
            primaryColorDark: Color(appColors.white),
            // Define the default font family.
            fontFamily: fontslatoregular.appFontlatoregular,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Color(appColors.white)),
          ),
          home: const Splash(),
        ));
  }
}





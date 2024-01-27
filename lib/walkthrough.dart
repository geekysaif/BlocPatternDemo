import 'package:flutter/material.dart';
import 'package:bloc_pattern_demo/common/BigLabel.dart';
import 'package:bloc_pattern_demo/common/CirclePageIndicator.dart';
import 'package:bloc_pattern_demo/common/Constants.dart';
import 'package:bloc_pattern_demo/common/shared_preference.dart';
import 'package:bloc_pattern_demo/resources/LatoBlack.dart';
import 'package:bloc_pattern_demo/resources/colors.dart';
import 'package:bloc_pattern_demo/resources/images.dart';

import 'loginui/login.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  PageViewer createState() {
    return PageViewer();
  }
}

class PageViewer extends State<WalkThrough> {
  late BuildContext mContext;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  String btnText = "Next";
  String imageclick = appImages.walkthrougharrow;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              _buildPageView(),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: GestureDetector(
                  onTap: () {
                    appPreferences.saveBoolPreference(
                        Constants.walkThroughVisited, true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(appColors.inputborder),
                          blurRadius: 2,
                          offset: const Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    height: 30,
                    width: 80,
                    margin: const EdgeInsets.fromLTRB(0.0, 20.0, 17.0, 0.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Skip".toUpperCase(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(appColors.yellow),
                          fontFamily: fontslatoblack.appFontlatoblack,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Column(
                            children: <Widget>[],
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                /*appPreferences.saveBoolPreference(Constants.walkThroughVisited,  true);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),);*/

                                if (_pageController.page!.toInt() < 5) {
                                  _pageController.jumpToPage(
                                      _pageController.page!.toInt() + 1);
                                  if (_pageController.page!.toInt() == 5) {
                                    imageclick =
                                        appImages.walkthrougharrowfinal;
                                    setState(() {});
                                  }
                                } else {
                                  appPreferences.saveBoolPreference(
                                      Constants.walkThroughVisited, true);
                                 /* Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );*/
                                }
                              },
                              child: Center(
                                  child: Image.asset(
                                imageclick,
                                height: 56,
                                width: 56,
                              )),
                            ),
                          ),
                          // Add box decoration
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin:
                        const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 30),
                    alignment: Alignment.bottomLeft,
                    child: _buildPageIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Container(
        child: PageView.builder(
            itemCount: 6,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              String image, titleA, titleB;
              if (index == 0) {
                imageclick = appImages.walkthrougharrow;
                image = appImages.walkThroughA;
                titleA =
                    "Welcome to Nimeya \n An AI driven personal finance wellness app";
                // titleB="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";
              } else if (index == 1) {
                imageclick = appImages.walkthrougharrow;
                image = appImages.walkThroughB;
                titleA =
                    "Track your financial net worth, get financial scores real time with investometer";
                //titleB="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";
              } else if (index == 2) {
                imageclick = appImages.walkthrougharrow;
                image = appImages.walkThroughF;
                titleA = "Get 360\u00B0 view of your investments & liabilities in one place securely. \nUpload key financial documents securely in Keepsafe";
                // titleB="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";
              } else if (index == 3) {
                imageclick = appImages.walkthrougharrow;
                image = appImages.walkThroughD;
                titleA =
                    "Manage investments and liabilities across family members with one account";
                //  titleB="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";
              } else if (index == 4) {
                imageclick = appImages.walkthrougharrow;
                image = appImages.walkThroughE;
                titleA =
                    "With Nimeya your information is safe, secure & private. All information are store in encrypted form";
                //titleB="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";
              } else {
                imageclick = appImages.walkthrougharrowfinal;
                image = appImages.walkThroughC;
                titleA =
                    "Get started with Nimeya and be in control with your finances";
                // titleB="Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ";
              }
              return SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(bottom: 160, top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 80, top: 0),
                          child: Image.asset(image,
                              height:
                                  (MediaQuery.of(context).size.height) * 0.3),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 18, bottom: 5),
                          child: BigLabel(
                              textAlign: TextAlign.center, title: titleA),
                        ),
                        /*  Container(
                        padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 15),
                        child: Label(textAlign:TextAlign.center,title:titleB,fontSize: 14,
                          color: Color( appColors.txtgray),),
                      )*/
                      ],
                    )),
              );
            },
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
              if (index == 5) {
                btnText = "GET STARTED";
              } else {
                btnText = "Next";
              }
              setState(() {});
            }));
  }

  Widget _buildPageIndicator() {
    return CirclePageIndicator(
      itemCount: 6,
      dotColor: Color(appColors.inputborder),
      selectedDotColor: Color(appColors.walkthroughdot),
      currentPageNotifier: _currentPageNotifier,
      size: 10.0,
      selectedSize: 10.0, onPageSelected: (int value) {  },
    );
  }
}

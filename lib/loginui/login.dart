import 'package:bloc_pattern_demo/common/ErrorLabel.dart';
import 'package:bloc_pattern_demo/common/Label.dart';
import 'package:bloc_pattern_demo/blocs/login_bloc.dart';
import 'package:bloc_pattern_demo/common/LoadingIndicator.dart';
import 'package:bloc_pattern_demo/resources/LatoBlack.dart';
import 'package:bloc_pattern_demo/resources/LatoBold.dart';
import 'package:bloc_pattern_demo/resources/LatoRegular.dart';
import 'package:bloc_pattern_demo/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../resources/images.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isConnected;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  RegExp emailregExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp passwordregExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!%@#\$&*~]).{8,}$');
  late String deviceType, deviceName, identifier_iemi, accessToken, deviceinfo;
  bool _isWebServiceCall = false;
  bool _loginServiceCall = false;
  bool valuefirst = false;
  bool _isObscure = true;
  bool _pswrdborder = false;
  bool _emailborder = false;
  bool login_statuskey = false;
  String login_typekey = '';
  late LoadingIndicator dialog;
  late FToast fToast;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String error_mesgemail = '', _error_mesgglobal = '', _error_mesgpswrd = '';
  bool error_passVisible = false;
  bool error_emailVisible = false;
  bool error_globalVisible = false;
  var currentFocus;
  String _paassicon = appImages.ic_eye_off;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(appColors.white),
      body: StreamBuilder(
          stream: loginBloc.loginData,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.active && _loginServiceCall) {
              late var status = snapshot.data!.strStatus;
              _loginServiceCall = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (status == 'success') {

                } else {
                  setState(() {
                    error_globalVisible = true;
                    _error_mesgglobal = snapshot.data!.message.toString();
                  });
                }
                print('no login');
                //CommonMethods.showSnackBar(_scaffoldKey,snapshot.data.message,false);
              });
            }
            return SafeArea(
              child: Directionality(
                  textDirection:
                  'ar' != null ? TextDirection.ltr : TextDirection.ltr,
                  child: GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        StreamBuilder(
                            stream: loginBloc.loginData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.active &&
                                  _isWebServiceCall) {
                                bool status = snapshot.data!.strStatus as bool;
                                _isWebServiceCall = false;
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (status) {
                                    setState(() {});
                                  }
                                });
                              }
                              return SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 40),
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  //border: Border.all(),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        appImages.forwardarrow),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                height: 120,
                                                width: 94,
                                                // fit: BoxFit.fill
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 20,
                                                  left: 15,
                                                  right: 25,
                                                  bottom: 20),
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.only(top: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Image.asset(
                                                    appImages.forwardarrow,
                                                    fit: BoxFit.none,
                                                    height: 62,
                                                    width: 234,
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 20, 20, 2),
                                                    child: Text(
                                                      'Welcome! User',
                                                      style: TextStyle(
                                                          color: Color(
                                                              appColors.black),
                                                          fontSize: 26,
                                                          fontFamily: fontslatoblack
                                                              .appFontlatoblack),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 20, 40),
                                                    child: Text(
                                                      'Enter your credentials to proceed.',
                                                      maxLines: 2,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Color(appColors
                                                              .gray_7D7D7D),
                                                          fontSize: 13,
                                                          fontFamily:
                                                          fontslatoregular
                                                              .appFontlatoregular),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 10),
                                                    child: Text(
                                                      'EMAIL ADDRESS',
                                                      style: TextStyle(
                                                        color: Color(appColors
                                                            .gray_7D7D7D),
                                                        fontFamily: fontslatoregular
                                                            .appFontlatoregular,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                      ),
                                                      maxLines: 1,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                        border: Border.all(
                                                            color: _emailborder
                                                                ? Color(
                                                                appColors
                                                                    .red)
                                                                : Color(
                                                                appColors
                                                                    .inputborder))),
                                                    margin: const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 0,
                                                        bottom: 10),
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: Color(appColors
                                                            .black_333333),
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                      ),
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      focusNode: _emailFocus,
                                                      controller:
                                                      _emailController,
                                                      onChanged: (term) {
                                                        setState(() {
                                                          String femail =
                                                          _emailController
                                                              .text
                                                              .trim();
                                                          if (femail.length >
                                                              1 &&
                                                              emailregExp
                                                                  .hasMatch(
                                                                  femail)) {
                                                            error_emailVisible =
                                                            false;
                                                            _emailborder =
                                                            false;
                                                          } else {
                                                            error_emailVisible =
                                                            true;
                                                            _emailborder = true;
                                                          }
                                                        });
                                                      },
                                                      decoration:
                                                      InputDecoration(
                                                        contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 10.0),
                                                        isDense: true,
                                                        hintText: 'Enter email',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12,
                                                            height: 0,
                                                            color: Color(
                                                                appColors
                                                                    .gray_7D7D7D)),
                                                        errorText: '',
                                                        errorStyle: const TextStyle(
                                                            fontSize: 16,
                                                            height: 0),
                                                        border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide
                                                                .none),
                                                        suffixIcon: IconButton(
                                                          icon: Icon(
                                                            Icons.email,
                                                            color: Color(
                                                                appColors
                                                                    .eye_CCCCCC),
                                                          ), onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    maintainSize: false,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    visible: error_emailVisible,
                                                    child: Align(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: Container(
                                                        // width: double.infinity,
                                                        margin: const EdgeInsets
                                                            .only(
                                                            left: 15, right: 5),
                                                        child: ErrorLabel(
                                                          title:
                                                          "_error_mesgemail",
                                                          color: Color(
                                                              appColors.red),
                                                          maxLines: 1,
                                                          textAlign:
                                                          TextAlign.center,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 10,
                                                        bottom: 10),
                                                    child: Text(
                                                      'PASSWORD',
                                                      style: TextStyle(
                                                        color: Color(appColors
                                                            .gray_7D7D7D),
                                                        fontFamily: fontslatoregular
                                                            .appFontlatoregular,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                      ),
                                                      maxLines: 1,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                4.0)),
                                                        border: Border.all(
                                                            color: _pswrdborder
                                                                ? Color(
                                                                appColors
                                                                    .red)
                                                                : Color(
                                                                appColors
                                                                    .inputborder))),
                                                    margin: const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 0,
                                                        bottom: 10),
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: Color(appColors
                                                            .black_333333),
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                      ),
                                                      focusNode: _passwordFocus,
                                                      obscureText: _isObscure,
                                                      controller:
                                                      _passwordController,
                                                      onChanged: (term) {
                                                        setState(() {
                                                          String pass =
                                                          _passwordController
                                                              .text
                                                              .trim();
                                                          if (pass.length > 7 &&
                                                              passwordregExp
                                                                  .hasMatch(
                                                                  pass)) {
                                                            error_passVisible =
                                                            false;
                                                            _pswrdborder =
                                                            false;
                                                          } else {
                                                            error_passVisible =
                                                            true;
                                                            _pswrdborder = true;
                                                          }
                                                        });
                                                      },
                                                      decoration:
                                                      InputDecoration(
                                                        contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 10.0),
                                                        isDense: true,
                                                        hintText:
                                                        'Enter password',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12,
                                                            height: 0,
                                                            color: Color(
                                                                appColors
                                                                    .gray_7D7D7D)),
                                                        errorText: '',
                                                        errorStyle: const TextStyle(
                                                            fontSize: 14,
                                                            height: 0),
                                                        counterText: '',
                                                        border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide
                                                                .none),
                                                        suffixIcon: IconButton(
                                                          onPressed: () {
                                                            if (_isObscure ==
                                                                false) {
                                                              _isObscure = true;
                                                              _paassicon =
                                                                  appImages
                                                                      .ic_eye_off;
                                                              setState(() {});
                                                            } else {
                                                              _isObscure =
                                                              false;
                                                              _paassicon =
                                                                  appImages
                                                                      .ic_eye_on;
                                                              setState(() {});
                                                            }
                                                          },
                                                          icon: Image.asset(
                                                            _paassicon,
                                                            height: 20,
                                                            width: 19,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    maintainSize: false,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    visible: error_passVisible,
                                                    child: Align(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: Container(
                                                        // width: double.infinity,
                                                        margin: const EdgeInsets
                                                            .only(
                                                            left: 15, right: 5),
                                                        child: ErrorLabel(
                                                          title:
                                                          _error_mesgpswrd,
                                                          color: Color(
                                                              appColors.red),
                                                          maxLines: 1,
                                                          textAlign:
                                                          TextAlign.center,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .only(
                                                        left: 0,
                                                        right: 10,
                                                        top: 0,
                                                        bottom: 10),
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              child: Checkbox(
                                                                checkColor: Color(
                                                                    appColors
                                                                        .white),
                                                                activeColor: Color(
                                                                    appColors
                                                                        .yellow),
                                                                value: this
                                                                    .valuefirst,
                                                                onChanged: (
                                                                    boolvalue) {
                                                                  setState(() {});
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Label(
                                                                title:
                                                                'Remember me',
                                                                color: Color(
                                                                    appColors
                                                                        .black_333333),
                                                                maxLines: 1,
                                                                textAlign:
                                                                TextAlign
                                                                    .start,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          onTap: () {

                                                          },
                                                          child: Container(
                                                            margin:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 0),
                                                            child: Label(
                                                              title:
                                                              'Forgot Password?',
                                                              color: Color(
                                                                  appColors
                                                                      .yellow),
                                                              maxLines: 1,
                                                              textAlign:
                                                              TextAlign
                                                                  .right,
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Visibility(
                                                    maintainSize: false,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    visible:
                                                    error_globalVisible,
                                                    child: Align(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: Container(
                                                        // width: double.infinity,
                                                        margin: const EdgeInsets
                                                            .only(
                                                            left: 15,
                                                            right: 5,
                                                            bottom: 10),
                                                        child: ErrorLabel(
                                                          title:
                                                          _error_mesgglobal,
                                                          color: Color(
                                                              appColors.red),
                                                          maxLines: 1,
                                                          textAlign:
                                                          TextAlign.center,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: ButtonTheme(
                                                      minWidth: 340.0,
                                                      height: 44.0,
                                                      child: Text(
                                                        'Sign in',
                                                        style: TextStyle(
                                                          color: Color(appColors
                                                              .black_272727),
                                                          fontSize: 14,
                                                          fontFamily: fontslatobold
                                                              .appFontlatobold,
                                                        ),
                                                      ),
                                                    )

                                                    ,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                          .only(
                                                          top: 50, bottom: 15),
                                                      child: Text(
                                                        'Or Continue With',
                                                        style: TextStyle(
                                                          color: Color(appColors
                                                              .black_272727),
                                                          fontSize: 14,
                                                          fontFamily: fontslatobold
                                                              .appFontlatobold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      margin: const EdgeInsets
                                                          .only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 5,
                                                          bottom: 10),
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {

                                                            },
                                                            child: Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    40),
                                                                child:
                                                                Image.asset(
                                                                  appImages
                                                                      .forwardarrow,
                                                                  // fit: BoxFit.cover,
                                                                  height: 100,
                                                                  width: 80,
                                                                )),
                                                          ),
                                                          Container(
                                                              height: 80,
                                                              child: VerticalDivider(
                                                                  color: Color(
                                                                      appColors
                                                                          .gray_7D7D7D))),
                                                          InkWell(
                                                            onTap: () {

                                                            },
                                                            child: Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                    right:
                                                                    40),
                                                                child:
                                                                Image.asset(
                                                                  appImages
                                                                      .forwardarrow,
                                                                  // fit: BoxFit.cover,
                                                                  height: 100,
                                                                  width: 80,
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                    Alignment.bottomCenter,
                                                    child: Container(
                                                      margin:
                                                      EdgeInsets.all(15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 0,
                                                                right: 0,
                                                                top: 5,
                                                                bottom: 10),
                                                            child: Text(
                                                              "Don't have an account?",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    appColors
                                                                        .black),
                                                                fontFamily:
                                                                fontslatoregular
                                                                    .appFontlatoregular,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                              ),
                                                              maxLines: 1,
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {

                                                            },
                                                            child: Container(
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  left: 0,
                                                                  right: 0,
                                                                  top: 5,
                                                                  bottom:
                                                                  10),
                                                              child: Text(
                                                                " Sign Up",
                                                                style:
                                                                TextStyle(
                                                                  color: Color(
                                                                      appColors
                                                                          .yellow),
                                                                  fontFamily:
                                                                  fontslatoregular
                                                                      .appFontlatoregular,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                ),
                                                                maxLines: 1,
                                                                textAlign:
                                                                TextAlign
                                                                    .right,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}

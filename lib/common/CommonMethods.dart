import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc_pattern_demo/resources/colors.dart';
import 'package:intl/intl.dart';


class CommonMethods {
  static String version="";
  static String appBadgeSupported="";
  static String userId="",companyId="",userRoleId="";
  static String companyName="",userRole="";

  static Future<bool> checkInternetConnectivity() async {
    String connectionStatus;
    bool isConnected = false;
    final Connectivity _connectivity = Connectivity();

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
      if (await _connectivity.checkConnectivity() ==
          ConnectivityResult.mobile) {
        print("===internetconnected==Mobile" + connectionStatus);
        isConnected = true;
        // I am connected to a mobile network.
      } else if (await _connectivity.checkConnectivity() ==
          ConnectivityResult.wifi) {
        isConnected = true;
        print("===internetconnected==wifi" + connectionStatus);
        // I am connected to a wifi network.
      } else if (await _connectivity.checkConnectivity() ==
          ConnectivityResult.none) {
        isConnected = false;
        print("===internetconnected==not" + connectionStatus);
      }
    } on PlatformException catch (e) {
      print("===internet==not connected" + e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }
    return isConnected;
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  static void moveCursorTolastPos(TextEditingController textField) {
    var cursorPos = TextSelection.fromPosition(
        TextPosition(offset: textField.text.length));
    textField.selection = cursorPos;
  }

  static bool validateEmail(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static void inputFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool  isConnect=false;

  static String dateFormatterYMDTime(String date){
    DateFormat df=DateFormat("dd MMM, yyyy 'at' hh:mm a");
    return df.format(DateFormat("yyyy-MM-dd HH:mm").parse(date));
  }

  static String dateFormatterTime(String date){
    DateFormat df=DateFormat.jm() ;
    return df.format(DateFormat("yyyy-MM-dd HH:mm").parse(date));
  }
  static String dateFormatterTimes(String date){
    DateFormat df=DateFormat.jm() ;
    return df.format(DateFormat("HH:mm").parse(date));
  }

  static String dateFormatterYMD(String date,{String? inputFormat,}){
    DateFormat df=DateFormat("dd MMM, yyyy");
    return df.format(DateFormat(inputFormat??"yyyy-MM-dd HH:mm").parse(date));
  }

  static String dateFormatterYMDate(String date,{String? inputFormat}){
    DateFormat df=DateFormat("dd-MM-yyyy");
    return df.format(DateFormat(inputFormat??"yyyy-MM-dd HH:mm").parse(date));
  }

  static String dateFormatterYYYYMMDD(String date){
    var inputFormat = DateFormat("dd-MM-yyyy");
    var date1 = inputFormat.parse(date);
    return inputFormat.format(DateFormat("yyyy-MM-dd").parse("$date1"));
  }

  static String dateFormatterYYYMMDD(String date){
    var inputFormat = DateFormat("yyyy-MM-dd");

    return inputFormat.format(DateFormat("yyyy-MM-dd").parse("$date"));
  }



  static getStatusColor(String status) {
    if(status!=null && status=="cancel"){
      return Color(appColors.inputborder);
    }else if(status!=null && status=="completed"){
      return Color(appColors.inputborder);
    }else{
      return Color(appColors.inputborder);
    }
  }


}

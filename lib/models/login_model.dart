import 'package:flutter/material.dart';

class LoginModel {
 late var message="";
 late var strStatus="";
 late var login="";
 late Map<String, dynamic> userJson;
 late BuildContext context;
 late var token="";

  LoginModel.fromJson(Map<String, dynamic> parsedJson) {
    strStatus = parsedJson['status'] ?? "";
    message = parsedJson['message'] ?? "";
    login = parsedJson['login'];


    if (strStatus == "success" && parsedJson['data'] != "") {


    }
  }


}

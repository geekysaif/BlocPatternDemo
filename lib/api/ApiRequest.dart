import 'dart:async';
import 'package:bloc_pattern_demo/common/Button.dart';
import 'package:bloc_pattern_demo/models/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern_demo/common/CommonMethods.dart';
import 'package:bloc_pattern_demo/common/Constants.dart';
import 'package:bloc_pattern_demo/common/Label.dart';
import 'package:bloc_pattern_demo/common/LoadingIndicator.dart';
import 'package:bloc_pattern_demo/common/shared_preference.dart';
import 'package:bloc_pattern_demo/resources/images.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:bloc_pattern_demo/loginui/login.dart';
import 'package:path/path.dart';
import 'CallBackListener.dart';

class ApiRequest {
  late BuildContext mContextLoader;
  late CallBackListener callBackListener;
  final JsonDecoder _decoder = JsonDecoder();
  dynamic resultFinal;
  Future<dynamic> apiRequestByGet(context, url, {showLoader = true}) async {
    http.Response response;
    LoadingIndicator dialog;
    var isConnected = await CommonMethods.checkInternetConnectivity();
    if (isConnected) {
      Map<String, String> headers = new Map();
      headers["Authorization"] = "Bearer " +
          await appPreferences.getStringPreference(Constants.accessToken);
      if (context != null && showLoader) {
        dialog = LoadingIndicator(context, isDismissible: true, showLogs: true);
        await dialog.show();
      }

      response = await http.get(url, headers: headers);
      print("UrlCheck===" + url);
      print("ResponseCheck===" + response.body);

      if (response.statusCode == 401) {
        appPreferences.saveBoolPreference(Constants.login_status, false);
        appPreferences.saveBoolPreference(Constants.rememberlogin, false);
        appPreferences.saveStringPreference(Constants.subscription_status, '');
        appPreferences.saveIntPreference(Constants.member_limit, 0);
        appPreferences.clearPhotoPreferences();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            ModalRoute.withName('/'));
      }
      else {
        return response;
      }
    } else {
      showNetworkDialog(context);
    }
  }

  Future<dynamic> apiRequestByPost(context, url, body,
      {showLoader = true}) async {
    http.Response response;
    LoadingIndicator dialog;
    var isConnected = await CommonMethods.checkInternetConnectivity();
    if (isConnected) {
      Map<String, String> headers = new Map();
      headers["Accept"] = "application/json";
      headers["Authorization"] = "Bearer " +
          await appPreferences.getStringPreference(Constants.accessToken);

      if (context != null && showLoader) {
        dialog = LoadingIndicator(context, isDismissible: true, showLogs: true);
        await dialog.show();
        print("dialogshow===show");
      }

      response = await http.post(url,
          body: body, headers: headers, encoding: Encoding.getByName("utf-8"));
      print("UrlCheck===" + url);
      print("BodyCheck===" + body.toString());
      print("ResponseCheck===" + response.body);
      resultFinal = _decoder.convert(response.body);
      print("resultFinal=" + response.body);

      if (response.statusCode == 401) {
        appPreferences.clearPreferences();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            ModalRoute.withName('/'));
      } else {
        return response;
      }

      if (response.statusCode == 503) {
      /*  Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AppMaintainence()),
            ModalRoute.withName('/'));*/
      } else {
        return response;
      }
    } else {
      showNetworkDialog(context);
    }
  }

  Future<dynamic> apiRequestByMultipart(context, url, fileMap, bodyMap) async {
    http.Response response;
    LoadingIndicator dialog;
    var isConnected = await CommonMethods.checkInternetConnectivity();
    if (isConnected) {
      List<dynamic> keysForImage =[];

      for (int i = 0; i < fileMap.length; i++) {
        String key = fileMap.keys.elementAt(i);
        keysForImage.add(key);
      }
      // string to uri
      var uri = Uri.parse(url);
      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      for (int i = 0; i < bodyMap.length; i++) {
        String key = bodyMap.keys.elementAt(i);
        request.fields[key] = bodyMap[key];
      }

      for (int i = 0; i < keysForImage.length; i++) {
        var stream = http.ByteStream(
            DelegatingStream.typed(fileMap[keysForImage[i]].openRead()));
        // get file length
        var length = await fileMap[keysForImage[i]].length();
        // multipart that takes file
        var multipartFile = http.MultipartFile(
            keysForImage[i], stream, length,
            filename: basename(fileMap[keysForImage[i]].path));
        // add file to multipart
        request.files.add(multipartFile);
      }

      Map<String, String> headers = new Map();
      headers["Accept"] = "application/json";
      headers["Authorization"] = "Bearer " +
          await appPreferences.getStringPreference(Constants.accessToken);

      request.headers.addAll(headers);

      if (context != null) {
        dialog = LoadingIndicator(context, isDismissible: true, showLogs: true);
        await dialog.show();
      }

      response = await http.Response.fromStream(await request.send());
      print("UrlCheck===" + url);
      print("BodyCheck===" + bodyMap.toString());
      print("ResponseCheck===" + response.body);

      if (response.statusCode == 401) {
        appPreferences.clearPreferences();
        /*  Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            ModalRoute.withName('/'));*/
      } else if (response.statusCode == 429) {
        /*  Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            ModalRoute.withName('/'));*/
      } else {
        print("Response Cceck===" + response.body);
        return response;
      }
    } else {
      showNetworkDialog(context);
    }
  }

  showNetworkDialog(context) {
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    appImages.forwardarrow,
                    height: 50,
                    width: 50,
                  ),
                ),
                Label(
                  textAlign: TextAlign.center,
                  title: "No Internet",
                  fontSize: 18,
                  fontWeight: FontWeight.w500, maxLines: 1,
                ),
                Label(
                  textAlign: TextAlign.center,
                  title: "Check Your  Internet Connection",
                  fontSize: 15,
                  fontWeight: FontWeight.w500, maxLines: 1,
                ),
              ],
            ),
            actions: <Widget>[
              Button(
                    onTap: () {
          Navigator.pop(context);
          }, width: 50, enabled: true, title: 'ok',  gradient: const LinearGradient(
                colors: <Color>[Colors.green, Colors.black],
              ),)
            ],
          );
        });
  }

//  ***************************Web Service Response*********************************

  Future<LoginModel> loginWebservice(context, body, String url) async {
    dynamic response = await apiRequestByPost(context, url, body);
    return LoginModel.fromJson(json.decode(response.body));
  }
}

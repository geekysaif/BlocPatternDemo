import 'dart:async';
import 'package:bloc_pattern_demo/api/ApiRequest.dart';
import 'package:bloc_pattern_demo/models/login_model.dart';


class Repository {
  final dataProvider = ApiRequest();

  Future<LoginModel> loginRepository(context, body, String url) =>
      dataProvider.loginWebservice(context, body, url);

}

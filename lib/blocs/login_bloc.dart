import 'package:bloc_pattern_demo/models/login_model.dart';
import 'package:bloc_pattern_demo/repository/Repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();

  final _loginDataFetch = PublishSubject<LoginModel>();

  Stream<LoginModel> get loginData => _loginDataFetch.stream;

  fetchLoginData(context, body, String loginUrl) async {
    LoginModel loginModel = await _repository.loginRepository(context, body, loginUrl);
    _loginDataFetch.sink.add(loginModel);
  }
  dispose() {
    _loginDataFetch.close();
  }
}

final loginBloc = LoginBloc();

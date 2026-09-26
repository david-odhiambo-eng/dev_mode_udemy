import 'package:dev_mode/backendService/signin_service.dart';
import 'package:dev_mode/model/sign_in.dart';

import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  final Signinservice _signinservice = Signinservice();
  //loading
  bool _isLoading = false;
  //error state
  String? _errorMessage;
  //result
  SignInModel? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  SignInModel? get user => _user;

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _signinservice.signInUser(
        email: email,
        password: password,
      );

      _user = response;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

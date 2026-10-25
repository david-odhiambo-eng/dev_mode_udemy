import 'package:dev_mode/backendService/signUpService.dart';
import 'package:dev_mode/model/auth/sign_up.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  final Signupservice _signupservice = Signupservice();
  //loading
  bool _isLoading = false;
  //error state
  String? _errorMessage;
  //result
  SignUpModel? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  SignUpModel? get user => _user;

  Future<void> signUpUser({
    required String playerName,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _signupservice.signUpUser(
        playerName: playerName,
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

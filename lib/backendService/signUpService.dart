import 'dart:convert';

import 'package:dev_mode/model/sign_up.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Signupservice {
  Future<SignUpModel> signUpUser({
    required String playerName,
    required String email,
    required String password,
  }) async {
    final baseUrl = dotenv.env['BACKEND_URL'];
    final url = Uri.parse('$baseUrl/signup');

    final body = jsonEncode({
      'player_name': playerName,
      'email': email,
      'password': password,
    });

    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return SignUpModel.fromJson(data);
      } else if (response.statusCode == 409) {
        final error = jsonDecode(response.body);
        throw error['detail'];
      } else {
        throw '${response.statusCode}';
      }
    } catch (e) {
      rethrow;
    }
  }
}

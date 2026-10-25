import 'dart:convert';
import 'package:dev_mode/model/get_quiz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<GetQuizModel>> getQuiz({required List<String> topicNames}) async {
  final baseUrl = dotenv.env['BACKEND_URL'];
  final url = Uri.parse('$baseUrl/questions');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'topic_names': topicNames});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final List<dynamic> questions = jsonDecode(response.body);
      return questions.map((quiz) {
        return GetQuizModel.fromJson(quiz);
      }).toList();
    } else if (response.statusCode == 500) {
      final error = jsonDecode(response.body);
      throw Exception('${error['detail']}');
    } else {
      throw Exception('${response.statusCode}');
    }
  } catch (e) {
    rethrow;
  }
}

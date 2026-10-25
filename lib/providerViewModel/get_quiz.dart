import 'package:dev_mode/backendService/get_quiz.dart';
import 'package:dev_mode/model/get_quiz.dart';
import 'package:flutter/material.dart';

class GetQuizProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<GetQuizModel>? _quizResponse;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<GetQuizModel>? get quizResponse => _quizResponse;

  Future<void> getQuizDb({required List<String> topicNames}) async {
    _isLoading = true;
    _errorMessage = null;
    _quizResponse = null;
    notifyListeners();

    try {
      final response = await getQuiz(topicNames: topicNames);
      _quizResponse = response;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

import 'package:dev_mode/model/get_quiz.dart';
import 'package:flutter/material.dart';

class QuizIndexAndRoundsProvider extends ChangeNotifier {
  bool isRoundStarted = false;
  int quizIndex = 0;

  void addIndex({required List<GetQuizModel>? questions}) {
    if (questions == null || quizIndex >= questions.length-1 || !isRoundStarted) {
      print('NO INCREMENT');
      return;
    } else {
      quizIndex++;
      notifyListeners();
    }
  }

  void subtractIndex({required List<GetQuizModel>? questions}) {
    if (questions == null || quizIndex <= 0 || !isRoundStarted) {
      print('NO DECREMENT');
      return;
    } else {
      quizIndex--;
      notifyListeners();
    }
  }

  void startRound() {
    isRoundStarted = true;
    notifyListeners();
  }

  void endRound() {
    isRoundStarted = false;
    notifyListeners();
  }
}

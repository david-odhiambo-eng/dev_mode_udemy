import 'package:dev_mode/model/get_quiz.dart';
import 'package:flutter/material.dart';

class TeamQuizDataProvider extends ChangeNotifier {
  Map<String, List<GetQuizModel>?> teamData = {};

  void addTeamData({
    required String teamName,
    required List<GetQuizModel>? questions,
  }) {
    teamData[teamName] = questions;
    print('TEAM DATA VALUES: ...$teamData');
    notifyListeners();
  }
}

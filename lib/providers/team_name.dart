import 'package:flutter/material.dart';

class SelectedTeamProvider extends ChangeNotifier{
  String selectedTeamName = '';

  void selectTeamName({required String teamName}){
    selectedTeamName = teamName;
    print('SELECTED TEAM IS: ... $selectedTeamName');
   
    notifyListeners();
  }
}
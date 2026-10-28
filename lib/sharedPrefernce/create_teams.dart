//saving team names locally

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveTeamNames({required List<String> teamNames}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('teamNames', teamNames);
}

//get the team names
Future<List<String>> getTeamNames() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('teamNames') ?? [];
}
//delete team names
Future<void> deleteTeamNames({required int teamNameIndex})async{
  final prefs = await SharedPreferences.getInstance();
  final teamNames = prefs.getStringList('teamNames') ?? [];
  if(teamNameIndex < 0 || teamNameIndex >= teamNames.length){return;}
  teamNames.removeAt(teamNameIndex);
  prefs.setStringList('teamNames', teamNames);
}
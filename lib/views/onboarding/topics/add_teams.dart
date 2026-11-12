import 'package:dev_mode/providers/team_name.dart';
import 'package:dev_mode/providers/team_quiz_data.dart';
import 'package:dev_mode/sharedPrefernce/create_teams.dart';
import 'package:dev_mode/views/home/home.dart';

import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/onboarding/topics/topics.dart';
import 'package:dev_mode/views/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddTeams extends StatefulWidget {
  const AddTeams({super.key});

  @override
  State<AddTeams> createState() => _AddTeamsState();
}

class _AddTeamsState extends State<AddTeams> {
  final TextEditingController _teamNamesController = TextEditingController();
  bool _isTextFieldShowing = false;
  bool _isEditing = false;
  List<String> _teams = [];
  List<String> _tempTeamNames = [];
  Set<String> _seletceteTeam = {};

  @override
  void initState() {
    _loadTeamNames();
    super.initState();
  }

  //loading team names from local db
  Future<void> _loadTeamNames() async {
    List<String> teamNames = await getTeamNames();
    setState(() {
      _teams = teamNames;
    });
  }

  @override
  Widget build(BuildContext context) {
    SelectedTeamProvider selectedTeamProvider = context
        .read<SelectedTeamProvider>();
    TeamQuizDataProvider teamQuizDataProvider = context
        .read<TeamQuizDataProvider>();
    return Scaffold(
      body: HomeImage(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 32),
                const Text(
                  'TEAM SETUP',
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'JetBrainsMono',
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "What is your team's name?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'JetBrainsMono',
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Create teams to organize your game.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontFamily: 'JetBrainsMono',
                    fontSize: 12,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.peopleGroup,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_teams.length} teams added',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'JetBrainsMono',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Manage your teams below',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontFamily: 'JetBrainsMono',
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTextFieldShowing = !_isTextFieldShowing;
                          });
                        },
                        child: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: mainButttonColor,
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                _isTextFieldShowing
                    ? Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.18),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NEW TEAM',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'JetBrainsMono',
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: _teamNamesController,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'JetBrainsMono',
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    if (_teamNamesController.text.isNotEmpty) {
                                      _tempTeamNames.add(
                                        _teamNamesController.text.trim(),
                                      );
                                      await saveTeamNames(
                                        teamNames: _tempTeamNames,
                                      );
                                      _loadTeamNames();
                                      setState(() {});
                                    }
                                    _teamNamesController.clear();
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.paperPlane,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                hintText: 'Enter team name',
                                hintStyle: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.35),
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.black.withValues(alpha: 0.2),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.15),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'YOUR TEAMS',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JetBrainsMono',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Text(
                      '${_teams.length}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontFamily: 'JetBrainsMono',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  height: _teams.isEmpty ? null : 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: _teams.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.peopleGroup,
                                color: Colors.white.withValues(alpha: 0.35),
                                size: 28,
                              ),
                              SizedBox(height: 14),
                              Text(
                                'No teams yet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 14),
                              Text(
                                'Tap + above to create your first team',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _teams.length,
                          itemBuilder: (context, index) {
                            final teamName = _teams[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 6,
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _isEditing = !_isEditing;
                                      if (!_seletceteTeam.contains(teamName) &&
                                          _seletceteTeam.isEmpty) {
                                        setState(() {
                                          _seletceteTeam.add(teamName);
                                          selectedTeamProvider.selectTeamName(
                                            teamName: teamName,
                                          );
                                        });
                                      } else {
                                        setState(() {
                                          _seletceteTeam.clear();
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color: mainButttonColor,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.pen,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            _seletceteTeam.contains(teamName)
                                            ? Colors.white
                                            : mainButttonColor,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (!_seletceteTeam.contains(
                                              teamName,
                                            ) &&
                                            _seletceteTeam.isEmpty) {
                                          setState(() {
                                            _seletceteTeam.add(teamName);
                                            selectedTeamProvider.selectTeamName(
                                              teamName: teamName,
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            _seletceteTeam.clear();
                                          });
                                        }
                                      },
                                      child: Text(
                                        teamName,
                                        style: TextStyle(
                                          color:
                                              _seletceteTeam.contains(teamName)
                                              ? Colors.black
                                              : Colors.white,
                                          fontFamily: 'JetBrainsMono',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await deleteTeamNames(
                                        teamNameIndex: index,
                                      );
                                      await _loadTeamNames();
                                      if (index < _tempTeamNames.length) {
                                        _tempTeamNames.removeAt(index);
                                      }
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.trash,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 28),
                _seletceteTeam.isNotEmpty
                    ? SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainButttonColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12),
                            ),
                            elevation: 0,
                          ),
                          onPressed: _isEditing
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TopicsPage(),
                                    ),
                                  );
                                }
                              : () {
                                  bool teamExists = teamQuizDataProvider
                                      .teamData
                                      .containsKey(
                                        selectedTeamProvider.selectedTeamName,
                                      );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => teamExists
                                          ? HomePage()
                                          : TopicsPage(),
                                    ),
                                  );
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'PROCEED',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JetBrainsMono',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(width: 10),
                              FaIcon(FontAwesomeIcons.arrowRight, size: 14),
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

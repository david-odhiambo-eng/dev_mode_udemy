import 'package:dev_mode/providers/team_name.dart';
import 'package:dev_mode/views/home/clock_timer.dart';
import 'package:dev_mode/views/home/code_snippet.dart';
import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/home/ps_pad.dart';

import 'package:dev_mode/views/home/scrollable.dart';
import 'package:dev_mode/views/onboarding/topics/add_teams.dart';
import 'package:dev_mode/views/onboarding/topics/topics.dart';
import 'package:dev_mode/views/reusables/colors.dart';
import 'package:dev_mode/views/reusables/icons_bool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SelectedTeamProvider selectedTeamProvider = context
        .read<SelectedTeamProvider>();
    return Scaffold(
      body: HomeImage(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  ScrollablePage(),
                  SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: mainButttonColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    onPressed: () {
                      setState(() {
                        //topics
                        isAiSelected = false;
                        isMlSelected = false;
                        isDsaSelected = false;
                        isDockerSelected = false;
                        isDatabaseSelected = false;
                        isCodeSelected = false;
                        isGitSelected = false;
                        isServerSelected = false;
                        isWebSelected = false;

                        //languages
                        isPython = false;
                        isJs = false;
                        isJava = false;
                        isCpp = false;
                        isC = false;
                        isTypeScript = false;
                        isGo = false;
                        isRust = false;
                        isPhp = false;
                        isDart = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTeams()),
                      );
                    },
                    child: Text(
                      selectedTeamProvider.selectedTeamName,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JetBrainsMono',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CodeSnippet(),
                  SizedBox(height: 10),
                  Text(
                    'ROUND 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono',
                    ),
                  ),
                  PsPad(),
                  ClockTimer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

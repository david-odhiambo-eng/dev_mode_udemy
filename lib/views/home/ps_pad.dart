import 'package:dev_mode/model/get_quiz.dart';
import 'package:dev_mode/providers/quiz_index_and_rounds.dart';
import 'package:dev_mode/providers/team_name.dart';
import 'package:dev_mode/providers/team_quiz_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PsPad extends StatefulWidget {
  const PsPad({super.key});

  @override
  State<PsPad> createState() => _PsPadState();
}

class _PsPadState extends State<PsPad> {
  static const double imageAspectRatio = 1536 / 1024; //1.5 : 1
  static const double designWidth = 360;
  static const double designHeight = 240;
  @override
  Widget build(BuildContext context) {
    QuizIndexAndRoundsProvider quizIndexAndRoundsProvider = context
        .read<QuizIndexAndRoundsProvider>();
        Map<String, List<GetQuizModel>?> teamData = context
        .watch<TeamQuizDataProvider>()
        .teamData;
    String selectedTeamName = context
        .watch<SelectedTeamProvider>()
        .selectedTeamName;
    List<GetQuizModel>? questions = teamData[selectedTeamName];
    return AspectRatio(
      aspectRatio: imageAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double h = constraints.maxHeight;
          double w = constraints.maxWidth;
          double px(double value) => value * (w / designWidth);
          double py(double value) => value * (h / designHeight);

          return Stack(
            children: [
              Image.asset(height: h, width: w, 'assets/images/ps_pad.png'),
              //positioned 1
              Positioned(
                top: py(50),
                left: px(258),
                child: _buttons(
                  child: IconButton(
                    onPressed: () {
                      quizIndexAndRoundsProvider.addIndex(questions: questions);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              //positioned 2
              Positioned(
                top: py(50),
                right: px(255),
                child: _buttons(
                  child: IconButton(
                    onPressed: () {
                      quizIndexAndRoundsProvider.subtractIndex(questions: questions);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              //positioned 3
              Positioned(
                top: py(95),
                right: px(205),
                child: _buttons(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove, color: Colors.red),
                  ),
                ),
              ),

              //positioned 4
              Positioned(
                top: py(95),
                left: px(205),
                child: _buttons(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.green),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //buttons
  Widget _buttons({required Widget child}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(0xFF232418),
      child: child,
    );
  }
}

import 'package:dev_mode/model/get_quiz.dart';
import 'package:dev_mode/providers/quiz_index_and_rounds.dart';
import 'package:dev_mode/providers/team_name.dart';
import 'package:dev_mode/providers/team_quiz_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CodeSnippet extends StatefulWidget {
  const CodeSnippet({super.key});

  @override
  State<CodeSnippet> createState() => _CodeSnippetState();
}

class _CodeSnippetState extends State<CodeSnippet> {
  

  @override
  Widget build(BuildContext context) {
    QuizIndexAndRoundsProvider quizIndexAndRoundsProvider = context
        .watch<QuizIndexAndRoundsProvider>();
    Map<String, List<GetQuizModel>?> teamData = context
        .watch<TeamQuizDataProvider>()
        .teamData;
    String selectedTeamName = context
        .watch<SelectedTeamProvider>()
        .selectedTeamName;
    List<GetQuizModel>? questions = teamData[selectedTeamName];
    int quizIndex = context.watch<QuizIndexAndRoundsProvider>().quizIndex;
    GetQuizModel? question;
    if (questions != null &&
        questions.isNotEmpty &&
        quizIndex >= 0 &&
        quizIndex < questions.length) {
      question = questions[quizIndex];
    }

    return quizIndexAndRoundsProvider.isRoundStarted
        ? Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 42,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      _showContainerDots(color: Colors.red),
                      SizedBox(width: 6),
                      _showContainerDots(color: Colors.amber),
                      SizedBox(width: 6),
                      _showContainerDots(color: Colors.green),
                      Spacer(),
                      Text(
                        question?.topic ?? 'topic',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.55),
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          question?.quiz ??
                              'No questions under\nselected topics\nTry selecting other topics',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'JetBrainsMono',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _showKeyWordsAndAnswer(
                  topic: 'Keyword: ',
                  topicValue:
                      question?.keyWord ?? 'word to describe will show here',
                  topicValueColor: Colors.red,
                ),

                _showKeyWordsAndAnswer(
                  topic: 'Answer: ',
                  topicValue: question?.answer ?? '',
                  topicValueColor: Colors.green,
                  visibility: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'READY TO START ONCE YOU PRESS\n                  THE GO BUTTON',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'JetBarainsMONO',
                ),
              ),
            ),
          );
  }

  //show key words
  Widget _showKeyWordsAndAnswer({
    required String topic,
    required String topicValue,
    required Color topicValueColor,
    Widget? visibility,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 6),
      child: Row(
        children: [
          Text(
            topic,
            style: TextStyle(color: Colors.white, fontFamily: 'JetBrainsMono'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                topicValue,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  color: topicValueColor,
                ),
              ),
            ),
          ),
          ?visibility,
        ],
      ),
    );
  }

  //dots
  Widget _showContainerDots({required Color color}) {
    return Container(
      height: 9,
      width: 9,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

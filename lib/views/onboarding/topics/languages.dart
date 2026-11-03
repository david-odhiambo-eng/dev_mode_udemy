import 'package:dev_mode/model/get_quiz.dart';
import 'package:dev_mode/providerViewModel/get_quiz.dart';
import 'package:dev_mode/providers/team_name.dart';
import 'package:dev_mode/providers/team_quiz_data.dart';
import 'package:dev_mode/providers/topic_names_provider.dart';
import 'package:dev_mode/views/home/home.dart';
import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/reusables/colors.dart';
import 'package:dev_mode/views/reusables/icons_bool.dart';
import 'package:dev_mode/views/reusables/success_error.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  bool _isDone = false;
  int _languageCount = 0;
  @override
  Widget build(BuildContext context) {
    TopicNamesProvider topicsNameProvider = context.read<TopicNamesProvider>();
    GetQuizProvider getQuizProvider = context.read<GetQuizProvider>();
    SelectedTeamProvider selectedTeamProvider = context
        .read<SelectedTeamProvider>();
    TeamQuizDataProvider teamQuizDataProvider = context
        .read<TeamQuizDataProvider>();
    return Scaffold(
      body: HomeImage(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Text(
                  'What is you favorite language(s)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'JetBrainsMono',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 35),
                Expanded(
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 18,
                      runSpacing: 24,
                      children: [
                        //language icons

                        //PYTHON
                        _showCodeLanguages(
                          languageName: 'Python',
                          icon: FontAwesomeIcons.python,
                          iconColor: isPython
                              ? Colors.green
                              : Color(0xFF3776AB),
                          onTap: () {
                            setState(() {
                              isPython = !isPython;
                            });

                            isPython ? _increaseCount() : _reduceCount();
                            isPython
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'Python',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'Python',
                                  );
                          },
                        ),

                        //JS
                        _showCodeLanguages(
                          languageName: 'JavaScript',
                          icon: FontAwesomeIcons.js,
                          iconColor: isJs ? Colors.green : Color(0xFFF7DF1E),
                          onTap: () {
                            setState(() {
                              isJs = !isJs;
                            });

                            isJs ? _increaseCount() : _reduceCount();
                            isJs
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'JavaScript',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'JavaScript',
                                  );
                          },
                        ),

                        //JAVA
                        _showCodeLanguages(
                          languageName: 'Java',
                          icon: FontAwesomeIcons.java,
                          iconColor: isJava ? Colors.green : Color(0xFFED8B00),
                          onTap: () {
                            setState(() {
                              isJava = !isJava;
                            });
                            isJava ? _increaseCount() : _reduceCount();
                            isJava
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'Java',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'Java',
                                  );
                          },
                        ),

                        //C++
                        _showCodeLanguages(
                          languageName: 'C++',
                          icon: FontAwesomeIcons.code,
                          iconColor: isCpp ? Colors.green : Color(0xFF00599C),
                          onTap: () {
                            setState(() {
                              isCpp = !isCpp;
                            });
                            isCpp ? _increaseCount() : _reduceCount();
                            isCpp
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'C++',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'C++',
                                  );
                          },
                        ),

                        //C#
                        _showCodeLanguages(
                          languageName: 'C#',
                          icon: FontAwesomeIcons.cuttlefish,
                          iconColor: isC
                              ? Colors.green
                              : const Color(0xFF68217A),
                          onTap: () {
                            setState(() {
                              isC = !isC;
                            });
                            isC ? _increaseCount() : _reduceCount();
                            isC
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'C#',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'C#',
                                  );
                          },
                        ),

                        //TYPESCRIPT
                        _showCodeLanguages(
                          languageName: 'TypeScript',
                          icon: FontAwesomeIcons.js,
                          iconColor: isTypeScript
                              ? Colors.green
                              : Color(0xFF3178C6),
                          onTap: () {
                            setState(() {
                              isTypeScript = !isTypeScript;
                            });
                            isTypeScript ? _increaseCount() : _reduceCount();
                            isTypeScript
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'TypeScript',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'TypeScript',
                                  );
                          },
                        ),

                        //GO
                        _showCodeLanguages(
                          languageName: 'Go',
                          icon: FontAwesomeIcons.golang,
                          iconColor: isGo ? Colors.green : Color(0xFF00ADD8),
                          onTap: () {
                            setState(() {
                              isGo = !isGo;
                            });
                            isGo ? _increaseCount() : _reduceCount();
                            isGo
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'Go',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'Go',
                                  );
                          },
                        ),

                        //RUST
                        _showCodeLanguages(
                          languageName: 'Rust',
                          icon: FontAwesomeIcons.rust,
                          iconColor: isRust ? Colors.green : Color(0xFFDEA584),
                          onTap: () {
                            setState(() {
                              isRust = !isRust;
                            });
                            isRust ? _increaseCount() : _reduceCount();
                            isRust
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'Rust',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'Rust',
                                  );
                          },
                        ),

                        //PHP
                        _showCodeLanguages(
                          languageName: 'PHP',
                          icon: FontAwesomeIcons.php,
                          iconColor: isPhp ? Colors.green : Color(0xFF777BB4),
                          onTap: () {
                            setState(() {
                              isPhp = !isPhp;
                            });
                            isPhp ? _increaseCount() : _reduceCount();
                            isPhp
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'PHP',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'PHP',
                                  );
                          },
                        ),

                        //DART
                        _showCodeLanguages(
                          languageName: 'Dart',
                          icon: FontAwesomeIcons.dartLang,
                          iconColor: isDart ? Colors.green : Color(0xFF0175C2),
                          onTap: () {
                            setState(() {
                              isDart = !isDart;
                            });
                            isDart ? _increaseCount() : _reduceCount();
                            isDart
                                ? topicsNameProvider.addTopicNames(
                                    topicName: 'Dart',
                                  )
                                : topicsNameProvider.deleteTopicName(
                                    topicName: 'Dart',
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                _isDone
                    ? SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainButttonColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            //sending request to backend
                            await getQuizProvider.getQuizDb(
                              topicNames: topicsNameProvider.topicNames,
                            );

                            if (!context.mounted) {
                              return;
                            }

                            if (getQuizProvider.quizResponse != null) {
                              List<GetQuizModel>? questions =
                                  getQuizProvider.quizResponse;
                              teamQuizDataProvider.addTeamData(
                                teamName: selectedTeamProvider.selectedTeamName,
                                questions: questions,
                              );

                              showErrorOrSuccess(
                                message: 'READY TO START',
                                color: Colors.green,
                                context: context,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            } else if (getQuizProvider.errorMessage != null) {
                              showErrorOrSuccess(
                                message: '${getQuizProvider.errorMessage}',
                                color: Colors.red,
                                context: context,
                              );
                            }
                            topicsNameProvider.clearAllTopics();
                            setState(() {
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
                              _languageCount = 0;
                            });
                          },
                          child: const Text(
                            'DONE',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'JetBrainsMono',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_languageCount.toString()}/10',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JetBrainsMono',
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Languages',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        fontFamily: 'JetBrainsMono',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //increase language count
  void _increaseCount() {
    if (_languageCount < 10) {
      setState(() {
        _languageCount++;
        if (_languageCount >= 1) {
          _isDone = true;
        }
      });
    }
  }

  //reduce count
  void _reduceCount() {
    if (_languageCount > 0) {
      setState(() {
        _languageCount--;
      });
    }
    if (_languageCount == 0) {
      setState(() {
        _isDone = false;
      });
    }
  }

  //languages
  Widget _showCodeLanguages({
    required String languageName,
    required FaIconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.18),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: iconColor.withValues(alpha: 0.12),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(child: FaIcon(icon, color: iconColor, size: 48)),
          ),

          const SizedBox(height: 8),

          Text(
            languageName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.75),
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/reusables/colors.dart';
import 'package:dev_mode/views/reusables/icons_bool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                          onPressed: () {},
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

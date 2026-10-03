import 'package:dev_mode/views/onboarding/topics/languages.dart';
import 'package:dev_mode/views/reusables/colors.dart';
import 'package:dev_mode/views/reusables/icons_bool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  int _selectedTopicsCount = 0;
  Color _selectedTopicColor = Colors.red;
  bool _isNextButtonActive = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          //AI
          _popupIcons(
            top: 5,
            left: 5,
            icon: FontAwesomeIcons.robot,
            color: isAiSelected ? Colors.green : aiColor,
            label: 'AI',
            onTap: () {
              setState(() {
                isAiSelected = !isAiSelected;
              });

              isAiSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //ML
          _popupIcons(
            top: 5,
            left: 250,
            icon: FontAwesomeIcons.brain,
            color: isMlSelected ? Colors.green : mlColor,
            label: 'ML',
            onTap: () {
              setState(() {
                isMlSelected = !isMlSelected;
              });
              isMlSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //DOCKER
          _popupIcons(
            top: 145,
            left: 5,
            icon: FontAwesomeIcons.docker,
            color: isDockerSelected ? Colors.green : dockerColor,
            label: 'Docker',
            onTap: () {
              setState(() {
                isDockerSelected = !isDockerSelected;
              });
              isDockerSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //DATABASE
          _popupIcons(
            top: 145,
            left: 250,
            icon: FontAwesomeIcons.database,
            color: isDatabaseSelected ? Colors.green : databasesColor,
            label: 'Database',
            onTap: () {
              setState(() {
                isDatabaseSelected = !isDatabaseSelected;
              });
              isDatabaseSelected
                  ? _increaseTopicCount()
                  : _decreaseTopicCount();
            },
          ),
          //DSA
          _popupIcons(
            top: 75,
            left: 127,
            icon: FontAwesomeIcons.diagramProject,
            color: isDsaSelected ? Colors.green : algorithmsColor,
            label: 'DSA',
            isCentered: true,
            onTap: () {
              setState(() {
                isDsaSelected = !isDsaSelected;
              });
              isDsaSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //GIT
          _popupIcons(
            top: 285,
            left: 5,
            icon: FontAwesomeIcons.github,
            color: isGitSelected ? Colors.green : githubColor,
            label: 'Git',
            onTap: () {
              setState(() {
                isGitSelected = !isGitSelected;
              });
              isGitSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //BACKEND
          _popupIcons(
            top: 285,
            left: 250,
            icon: FontAwesomeIcons.server,
            color: isServerSelected ? Colors.green : serverColor,
            label: 'Backend',
            onTap: () {
              setState(() {
                isServerSelected = !isServerSelected;
              });
              isServerSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //CODE
          _popupIcons(
            top: 220,
            left: 127,
            icon: FontAwesomeIcons.code,
            color: isCodeSelected ? Colors.green : codingColor,
            label: 'Code',
            isCentered: true,
            onTap: () {
              setState(() {
                isCodeSelected = !isCodeSelected;
              });
              isCodeSelected ? _increaseTopicCount() : _decreaseTopicCount();
            },
          ),
          //WEB
          _popupIcons(
            top: 365,
            left: 127,
            icon: FontAwesomeIcons.globe,
            color: isWebSelected ? Colors.green : webDevelopmentColor,
            label: 'Web',
            isCentered: true,
            onTap: () {
              setState(() {
                isWebSelected = !isWebSelected;
                isWebSelected ? _increaseTopicCount() : _decreaseTopicCount();
              });
            },
          ),

          //NEXT
          Positioned(
            left: 125,
            bottom: 80,
            child: _isNextButtonActive
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainButttonColor,
                      foregroundColor: Colors.white,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Languages()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'JetBrainsMono',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        FaIcon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                          size: 12,
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),

          Positioned(
            bottom: 5,
            left: 125,
            child: Row(
              children: [
                Text(
                  '${_selectedTopicsCount.toString()}/9',
                  style: TextStyle(
                    color: _selectedTopicColor,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Selected',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //increasing count
  void _increaseTopicCount() {
    if (_selectedTopicsCount < 9) {
      setState(() {
        _selectedTopicsCount += 1;
        if (_selectedTopicsCount >= 3) {
          _selectedTopicColor = Colors.green;
          _isNextButtonActive = true;
        }
      });
    }
  }

  //decrease counter
  void _decreaseTopicCount() {
    if (_selectedTopicsCount >= 0) {
      setState(() {
        _selectedTopicsCount -= 1;
        if (_selectedTopicsCount < 3) {
          _selectedTopicColor = Colors.red;
        }
        if (_selectedTopicsCount >= 3) {
          _isNextButtonActive = true;
        } else {
          _isNextButtonActive = false;
        }
      });
    }
  }

  //icons
  Widget _popupIcons({
    required double top,
    required double left,
    required FaIconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
    bool isCentered = false,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: isCentered ? 70 : 62,
              width: isCentered ? 70 : 62,
              decoration: BoxDecoration(
                color: const Color(0xFF171717),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: color.withValues(alpha: 0.35),
                  width: 1,
                ),
              ),
              child: Center(
                child: FaIcon(icon, size: isCentered ? 31 : 27, color: color),
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontFamily: 'JetBrainsMono',
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

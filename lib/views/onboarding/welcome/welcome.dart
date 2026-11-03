import 'dart:async';

import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/onboarding/topics/add_teams.dart';
import 'package:dev_mode/views/onboarding/topics/topics.dart';
import 'package:dev_mode/views/reusables/type_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController _imageAnimationController;
  late Animation _imageAnimation;
  final String code = '''
def hello():
    return 'Welcome to Dev Mode'
                     
''';

  @override
  void initState() {
    _imageAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    _imageAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 160, end: 180), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 180, end: 160), weight: 50),
    ]).animate(_imageAnimationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: Image.asset('assets/images/mascotb.png'),
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withValues(alpha: 0.2),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.terminal, color: Colors.white),
                        SizedBox(height: 10),
                        //Typing
                        TypingTextWidget(text: code),
                      ],
                    ),
                  ),
                  SizedBox(height: 110),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTeams()),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JetBrainsMono',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedBuilder(
                      animation: _imageAnimation,
                      builder: (context, child) {
                        return SizedBox(
                          height: _imageAnimation.value,
                          width: _imageAnimation.value,
                          child: Image.asset(
                            'assets/images/mascotg.png',
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

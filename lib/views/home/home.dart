import 'package:dev_mode/views/home/clock_timer.dart';
import 'package:dev_mode/views/home/code_snippet.dart';
import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/home/ps_pad.dart';

import 'package:dev_mode/views/home/scrollable.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'DEV MODE',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono',
                    ),
                  ),
                  SizedBox(height: 10),
                  CodeSnippet(),
                  SizedBox(height: 10),
                  Text(
                    'Game Controllers',
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

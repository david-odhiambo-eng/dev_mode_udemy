import 'package:dev_mode/views/home/home_image.dart';
import 'package:dev_mode/views/onboarding/topics/dev_greetings.dart';
import 'package:dev_mode/views/onboarding/topics/icons_page.dart';
import 'package:flutter/material.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 18, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DevGreetings(),
                SizedBox(height: 22),
                Text(
                  'What\'s your favorite topics ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'JetBrainsMono',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: 12),
                IconsPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

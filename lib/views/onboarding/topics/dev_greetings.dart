import 'package:dev_mode/views/reusables/type_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DevGreetings extends StatefulWidget {
  const DevGreetings({super.key});

  @override
  State<DevGreetings> createState() => _DevGreetingsState();
}

class _DevGreetingsState extends State<DevGreetings> {
  final _fullText = 'Dev Mode...\nA Developer\'s fun place            ';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.terminal, color: Colors.white),
          SizedBox(width: 12,),
          Expanded(child: TypingTextWidget(text: _fullText))
        ],
      ),
      );
  }
}
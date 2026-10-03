import 'dart:async';

import 'package:flutter/material.dart';

class TypingTextWidget extends StatefulWidget {
  final String text;
  const TypingTextWidget({super.key, required this.text});

  @override
  State<TypingTextWidget> createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {
  String _displayText = '';
  late Timer _typingTimer;

  @override 
  void initState(){
    _typeText();
    super.initState();
  }


  void _typeText() {
    int currentIndex = 0;
    int lastIndex = widget.text.length - 1;

    _typingTimer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      if (mounted) {
        setState(() {
          _displayText += widget.text[currentIndex];
          currentIndex++;

          if (currentIndex == lastIndex) {
            currentIndex = 0;
            _displayText = '';
          }
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      style: TextStyle(color: Colors.white, fontFamily: 'JetBrainsMono'),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _typingTimer.cancel();
  }
}

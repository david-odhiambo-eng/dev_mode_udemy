import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class ScrollablePage extends StatefulWidget {
  const ScrollablePage({super.key});

  @override
  State<ScrollablePage> createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      duration: Duration(seconds: 200),
      gap: 40,
      enableScrollInput: true,
      delayAfterScrollInput: Duration(seconds: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _showKeyWords(number: '1', keyword: '**kwargs'),
          SizedBox(width: 10),
          _showKeyWords(number: '2', keyword: 'class'),
          SizedBox(width: 10),
          _showKeyWords(number: '3', keyword: 'tuple'),
          SizedBox(width: 10),
          _showKeyWords(number: '4', keyword: '__init__'),
          SizedBox(width: 10),
          _showKeyWords(number: '5', keyword: 'def'),
          SizedBox(width: 10),
          _showKeyWords(number: '6', keyword: 'self'),
          SizedBox(width: 10),
          _showKeyWords(number: '7', keyword: ':='),
          SizedBox(width: 10),
          _showKeyWords(number: '8', keyword: 'Database'),
          SizedBox(width: 10),
          _showKeyWords(number: '9', keyword: 'str'),
          SizedBox(width: 10),
          _showKeyWords(number: '10', keyword: '.env'),
        ],
      ),
    );
  }

  //displaying keyword
  Widget _showKeyWords({required String number, required String keyword}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$number. ',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '$keyword ',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

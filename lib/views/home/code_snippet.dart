import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeSnippet extends StatefulWidget {
  const CodeSnippet({super.key});

  @override
  State<CodeSnippet> createState() => _CodeSnippetState();
}

class _CodeSnippetState extends State<CodeSnippet> {
  String _language = 'dart';
  String code = '''
String convertToUpperCase(String name){
String upperCase = name.upperCase();
return name;
}
''';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF272822),
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
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
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
                  _language.toUpperCase(),
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
                child: HighlightView(
                  code,
                  language: _language,
                  theme: monokaiSublimeTheme,
                  padding: EdgeInsets.all(18),
                  textStyle: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          _showKeyWordsAndAnswer(
            topic: 'Keyword: ',
            topicValue: 'return',
            topicValueColor: Colors.red,
          ),

          _showKeyWordsAndAnswer(
            topic: 'Answer: ', 
            topicValue: 'Terminates a\nprogram', 
            topicValueColor: Colors.green,
            visibility: IconButton(onPressed: (){}, icon: Icon(Icons.visibility))
            )
        ],
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
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              topicValue,
              style: TextStyle(
                color: topicValueColor,
                fontFamily: 'JetBrainsMono',
              ),
            ),
          ),
          Spacer(),
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

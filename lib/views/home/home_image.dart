import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeImage extends StatefulWidget {
  Widget child;
  HomeImage({super.key, required this.child});

  @override
  State<HomeImage> createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  late Timer _colorTimer;
  Color _startColor = Colors.orange;

  @override
  void initState() {
    _selectRandomColor();
    super.initState();
  }

  //randomly accesing colors
  void _selectRandomColor() {
    List<Color> pageColors = [Colors.orange, Colors.white, Colors.yellow];

    _colorTimer = Timer.periodic(Duration(seconds: 30), (Timer timer) {
      Random random = Random();
      int randInt = random.nextInt(pageColors.length);
      setState(() {
        _startColor = pageColors[randInt];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 1,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(_startColor, BlendMode.color),
              child: Image.asset('assets/images/geeky.jpeg', fit: BoxFit.cover),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _colorTimer.cancel();
  }
}

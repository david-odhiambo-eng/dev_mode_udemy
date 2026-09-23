import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ClockTimer extends StatefulWidget {
  const ClockTimer({super.key});

  @override
  State<ClockTimer> createState() => _ClockTimerState();
}

class _ClockTimerState extends State<ClockTimer>
    with SingleTickerProviderStateMixin {
  Color _color = Colors.white;
  int _timerValue = 60;
  late Timer _clockTimer;
  late AnimationController _timerAnimationController;
  late Animation _timerAnimation;
  bool _isTimerStarted = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    _timerAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _timerAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 40, end: 80), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 80, end: 40), weight: 50),
    ]).animate(_timerAnimationController);

    super.initState();
  }

  //play audio
  Future<void> _playAudio()async{
    await _audioPlayer.play(AssetSource('audio/thanos.MP3'));
  }

  //changing timer value
  Future<void> _startTimer() async{
    setState(() {
      _isTimerStarted = true;
    });

    _timerAnimationController.forward(from: 0);

    _clockTimer = Timer.periodic(Duration(seconds: 1), (Timer timer){
      if (_timerValue > 0) {
        setState(() {
          _timerValue--;
        });

        if (_timerValue <= 10) {
          //change color
          setState(() {
            _color = Colors.red;
          });
        }
      }
      _timerAnimationController.forward(from: 0);

      if (_timerValue == 0) {
        timer.cancel();
        _playAudio();

        setState(() {
          _isTimerStarted = false;
          _timerValue = 60;
          _color = Colors.white;
        });

        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerAnimationController,
      builder: (BuildContext context, child) {
        return _isTimerStarted
            ? Text(
                _timerValue.toString(),
                style: TextStyle(
                  color: _color,
                  fontSize: _timerAnimation.value,
                  fontFamily: 'JetBrainsMono',
                ),
              )
            : _showGoButton();
      },
    );
  }

  //showing go button
  Widget _showGoButton() {
    return GestureDetector(
      onTap: () {
        _startTimer();
      },
      child: SizedBox(
        height: 110,
        width: 110,
        child: Image.asset('assets/images/go.png', fit: BoxFit.contain),
      ),
    );
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    _timerAnimationController.dispose();
    super.dispose();
  }
}

// Credit to Gleb Shalimov
// Github: https://github.com/khlebobul
// Original package: https://github.com/khlebobul/use_scramble/tree/main

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';

class LLScrambleText extends StatefulWidget {
  const LLScrambleText(
    this.text, {
    super.key,
    this.speed = const Duration(milliseconds: 50),
    this.correctCharProbability = 0.1,
    this.chars = '!<>-_\\/[]{}–=+*^?#________',
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
  });

  final String text;
  final Duration speed;
  final double correctCharProbability;
  final String chars;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  State<LLScrambleText> createState() => _LLScrambleTextState();
}

class _LLScrambleTextState extends State<LLScrambleText> {
  late String _displayText;
  final _random = math.Random();
  Timer? _timer;
  List<bool> _done = [];

  @override
  void initState() {
    super.initState();
    _displayText = '' * widget.text.length;
    _done = List.filled(widget.text.length, false);
    _startScramble();
  }

  void _startScramble() {
    int counter = 0;
    _timer = Timer.periodic(widget.speed, (timer) {
      // Check if it's time to end the animation.
      if (counter >= widget.text.length * 4) {
        timer.cancel();
        setState(() => _displayText = widget.text);
        return;
      }
      setState(() {
        _displayText = List.generate(widget.text.length, (int index) {
          // If the character is already set, return it.
          if (_done[index]) {
            return widget.text[index];
          }
          // With [widget.correctCharProbability], set the correct character.
          if (_random.nextDouble() < widget.correctCharProbability) {
            _done[index] = true;
            return widget.text[index];
          }
          // Otherwise, return a random character.
          return widget.chars[_random.nextInt(widget.chars.length)];
        }).join();
      });
      counter++;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
      style:
          GoogleFonts //
              .oxanium(color: LLColors.white)
              .merge(widget.style),
    );
  }
}

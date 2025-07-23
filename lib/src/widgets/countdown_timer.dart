import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';

class LLCountdownTimer extends StatefulWidget {
  const LLCountdownTimer({
    super.key,
    this.runOnBuild = true,
    this.duration,
    this.style,
  });

  final bool runOnBuild;
  final Duration? duration;
  final TextStyle? style;

  @override
  State<LLCountdownTimer> createState() => _LLCountdownTimerState();
}

class _LLCountdownTimerState extends State<LLCountdownTimer> {
  late Duration _duration;
  Timer? _timer;
  final _minutes = ValueNotifier<int>(0);
  final _seconds = ValueNotifier<int>(0);
  final _milliseconds = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    if (widget.runOnBuild) {
      _run();
    }
  }

  void _run() {
    _duration = widget.duration ?? Duration.zero;
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (_duration <= Duration.zero) {
        timer.cancel();
        return;
      }
      _duration -= Duration(milliseconds: 10);
      final minutes = _duration.inMinutes;
      if (_minutes.value != minutes) {
        _minutes.value = minutes;
      }
      var seconds = _duration.inSeconds;
      if (seconds > 60) {
        seconds %= 60;
      }
      if (_seconds.value != seconds) {
        _seconds.value = seconds;
      }
      var milliseconds = _duration.inMilliseconds;
      if (milliseconds > 1000) {
        milliseconds %= 1000;
      }
      if (_milliseconds.value != milliseconds) {
        _milliseconds.value = (milliseconds / 10).floor();
      }
    });
  }

  @override
  void dispose() {
    if (_timer?.isActive == true) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = widget.style?.fontSize ?? 34.0;
    return DefaultTextStyle.merge(
      style:
          GoogleFonts //
              .oxanium(
                color: LLColors.white,
                fontSize: fontSize,
              )
              .merge(widget.style),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          ValueListenableBuilder(
            valueListenable: _minutes,
            builder: (BuildContext context, int minutes, _) {
              return Text(
                minutes.toString().padLeft(2, '0'),
                style: TextStyle(
                  inherit: true,
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _seconds,
            builder: (BuildContext context, int seconds, _) {
              return Text(
                ':${seconds.toString().padLeft(2, '0')}',
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _milliseconds,
            builder: (BuildContext context, int milliseconds, _) {
              return Text(
                ':${milliseconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  inherit: true,
                  fontSize: fontSize / 2.0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

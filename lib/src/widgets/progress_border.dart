import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';

class LLProgressBorder extends StatefulWidget {
  const LLProgressBorder({
    super.key,
    this.progress,
    this.child,
  });

  final double? progress;
  final Widget? child;

  @override
  State<LLProgressBorder> createState() => LLProgressBorderState();
}

class LLProgressBorderState extends State<LLProgressBorder> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: LLTheme.defaultAnimationDuration * 3.0,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.progress case double progress) {
      return CustomPaint(
        painter: _BorderPainter(progress: progress),
        child: widget.child,
      );
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: _BorderPainter(progress: _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _BorderPainter extends CustomPainter {
  _BorderPainter({required this.progress})
    : assert(
        progress >= 0 && progress <= 1,
        'Progress must be a double between 0.0 and 1.0.',
      );

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = LLColors.white
      ..strokeWidth = 1.5;
    final length = size.width + size.height;
    final horizontalLength = size.width / 2.0;
    final verticalLength = size.height;
    final progressLength = length * progress;
    // Draw bottom.
    if (progressLength <= horizontalLength) {
      // Draw left.
      canvas.drawLine(
        Offset(horizontalLength, verticalLength),
        Offset(horizontalLength - progressLength, verticalLength),
        borderPaint,
      );
      // Draw right.
      canvas.drawLine(
        Offset(horizontalLength, verticalLength),
        Offset(horizontalLength + progressLength, verticalLength),
        borderPaint,
      );
      return;
    } else {
      // Draw left.
      canvas.drawLine(
        Offset(horizontalLength, verticalLength),
        Offset(0.0, verticalLength),
        borderPaint,
      );
      // Draw left.
      canvas.drawLine(
        Offset(horizontalLength, verticalLength),
        Offset(horizontalLength * 2.0, verticalLength),
        borderPaint,
      );
    }
    // Draw sides.
    if (progressLength <= horizontalLength + verticalLength) {
      // Draw left.
      canvas.drawLine(
        Offset(0.0, verticalLength),
        Offset(0.0, verticalLength - (progressLength - horizontalLength)),
        borderPaint,
      );
      // Draw right.
      canvas.drawLine(
        Offset(horizontalLength * 2.0, verticalLength),
        Offset(horizontalLength * 2.0, verticalLength - (progressLength - horizontalLength)),
        borderPaint,
      );
    } else {
      // Draw left.
      canvas.drawLine(
        Offset(0.0, verticalLength),
        Offset.zero,
        borderPaint,
      );
      // Draw right.
      canvas.drawLine(
        Offset(horizontalLength * 2.0, verticalLength),
        Offset(horizontalLength * 2.0, 0.0),
        borderPaint,
      );
    }
    // Draw top.
    if (progressLength > horizontalLength + verticalLength) {
      // Draw left.
      canvas.drawLine(
        Offset.zero,
        Offset(progressLength - horizontalLength - verticalLength, 0.0),
        borderPaint,
      );
      // Draw right.
      canvas.drawLine(
        Offset(horizontalLength * 2.0, 0.0),
        Offset(horizontalLength * 2.0 - (progressLength - horizontalLength - verticalLength), 0.0),
        borderPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BorderPainter oldDelegate) => progress != oldDelegate.progress;
}

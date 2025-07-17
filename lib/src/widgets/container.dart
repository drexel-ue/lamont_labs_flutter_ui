import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:lamont_labs_flutter_ui/src/layout.dart';

class LLContainer extends StatelessWidget {
  const LLContainer({
    super.key,
    this.padding = emptyPadding,
    this.color = LLColors.black,
    this.child,
  }) : adaptive = false,
       shouldBlur = false,
       blurStyle = null;

  LLContainer.glass({
    super.key,
    this.padding = emptyPadding,
    Color? color,
    ImageFilter? blur,
    this.child,
  }) : adaptive = false,
       color = color ?? LLColors.black.withValues(alpha: 0.5),
       shouldBlur = true,
       blurStyle = blur ?? LLBlurStyles.lightBlur;

  LLContainer.adaptive({
    super.key,
    this.padding = emptyPadding,
    Color? color,
    ImageFilter? blur,
    this.child,
  }) : adaptive = true,
       color = color ?? LLColors.black.withValues(alpha: 0.5),
       shouldBlur = false,
       blurStyle = blur ?? LLBlurStyles.lightBlur;

  /// Internal padding from border to child.
  final EdgeInsets padding;

  /// Should display galss on iOS and opaque on others automatically.
  final bool adaptive;

  /// Should we blur at all?
  final bool shouldBlur;

  /// Blur severity.
  final ImageFilter? blurStyle;

  /// Background color.
  final Color color;

  /// Child.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final paddedChild = Padding(
      padding: padding,
      child: child,
    );
    const borderWidth = 1.5;
    const innerPadding = EdgeInsetsGeometry.all(3.0 * borderWidth);
    final isApple = [TargetPlatform.iOS, TargetPlatform.macOS].contains(Theme.of(context).platform);
    if (shouldBlur || (adaptive && isApple)) {
      return Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: _AnimatedBorder(
              child: child,
            ),
          ),
          Padding(
            padding: innerPadding,
            child: ClipRRect(
              child: BackdropFilter(
                filter: blurStyle!,
                child: ColoredBox(
                  color: color,
                  child: child,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return _AnimatedBorder(
      child: Padding(
        padding: innerPadding,
        child: ColoredBox(
          color: color,
          child: paddedChild,
        ),
      ),
    );
  }
}

class _AnimatedBorder extends StatefulWidget {
  const _AnimatedBorder({
    this.progress,
    this.child,
  });

  final double? progress;
  final Widget? child;

  @override
  State<_AnimatedBorder> createState() => _AnimatedBorderState();
}

class _AnimatedBorderState extends State<_AnimatedBorder> with SingleTickerProviderStateMixin {
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

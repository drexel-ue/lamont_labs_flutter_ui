import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';

class LLButton extends StatelessWidget {
  const LLButton({
    super.key,
    this.onTap,
    this.onLongPress,
    this.color = LLColors.black,
    this.blur,
    this.glass = false,
    this.adaptive = false,
    this.child,
  });

  LLButton.glass({
    super.key,
    this.onTap,
    this.onLongPress,
    this.color = LLColors.black,
    ImageFilter? blur,
    this.child,
  }) : blur = blur ?? LLBlurStyles.lightBlur,
       glass = true,
       adaptive = false;

  LLButton.adpative({
    super.key,
    this.onTap,
    this.onLongPress,
    this.color = LLColors.black,
    ImageFilter? blur,
    this.child,
  }) : blur = blur ?? LLBlurStyles.lightBlur,
       glass = false,
       adaptive = true;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color color;
  final ImageFilter? blur;
  final bool glass;
  final bool adaptive;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final inkwell = InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Center(
        child: Padding(
          padding: allPadding8,
          child: child,
        ),
      ),
    );
    final fillColor = onTap != null || onLongPress != null ? color : color.withValues(alpha: 0.5);
    if (glass) {
      return LLContainer.glass(
        color: fillColor,
        blur: blur,
        child: inkwell,
      );
    }
    if (adaptive) {
      return LLContainer.adaptive(
        color: fillColor,
        blur: blur,
        child: inkwell,
      );
    }
    return LLContainer(
      color: fillColor,
      child: inkwell,
    );
  }
}

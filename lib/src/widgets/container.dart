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
    final decoration = BoxDecoration(
      border: Border.all(
        color: LLColors.white,
        width: borderWidth,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    );
    const innerPadding = EdgeInsetsGeometry.all(3.0 * borderWidth);
    final isApple = [TargetPlatform.iOS, TargetPlatform.macOS].contains(Theme.of(context).platform);
    if (shouldBlur || (adaptive && isApple)) {
      return Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: decoration,
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
    return DecoratedBox(
      decoration: decoration,
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

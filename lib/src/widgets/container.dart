import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/src/colors.dart';
import 'package:lamont_labs_flutter_ui/src/layout.dart';

class LLContainer extends StatelessWidget {
  const LLContainer({
    super.key,
    this.padding = emptyPadding,
    this.child,
  });

  /// Internal padding from border to child.
  final EdgeInsets padding;

  /// Child.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: LLColors.black,
        border: Border.all(
          color: LLColors.white,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

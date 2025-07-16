import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class SizeKnobs extends StatelessWidget {
  const SizeKnobs({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: SizedBox(
            width: context.knobs.double.slider(
              label: 'Width',
              initialValue: constraints.maxWidth * 0.5,
              min: constraints.minWidth,
              max: constraints.maxWidth,
            ),
            height: context.knobs.double.slider(
              label: 'Height',
              initialValue: constraints.maxHeight * 0.5,
              min: constraints.minHeight,
              max: constraints.maxHeight,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

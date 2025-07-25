import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/helpers/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLProgressBorder)
Widget buildLLProgressBorderUseCase(BuildContext context) {
  return const SizeKnobs(
    child: LLProgressBorder(),
  );
}

@widgetbook.UseCase(name: 'Static Progress', type: LLProgressBorder)
Widget buildStaticLLProgressBorderUseCase(BuildContext context) {
  return SizeKnobs(
    child: LLProgressBorder(
      progress: context.knobs.double.slider(
        label: 'Progress',
        initialValue: 0.5,
        min: 0.0,
        max: 1.0,
      ),
    ),
  );
}

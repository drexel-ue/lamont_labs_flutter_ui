import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/widgets/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLCountdownTimer)
Widget buildLLCountdownTimerUseCase(BuildContext context) {
  return SizeKnobs(
    child: LLCountdownTimer(
      duration: context.knobs.duration(label: 'Duration'),
    ),
  );
}

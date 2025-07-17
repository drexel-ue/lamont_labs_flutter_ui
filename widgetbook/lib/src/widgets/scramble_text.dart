import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/widgets/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLScrambleText)
Widget buildLLContainerUseCase(BuildContext context) {
  return SizeKnobs(
    child: LLScrambleText(
      context.knobs.string(
        label: 'Text',
        initialValue: 'Wow, such cool!',
      ),
      maxLines: context.knobs.intOrNull.input(label: 'Max Lines'),
      style: TextStyle(
        fontSize: context.knobs.double.input(label: 'Font Size', initialValue: 14.0),
      ),
    ),
  );
}

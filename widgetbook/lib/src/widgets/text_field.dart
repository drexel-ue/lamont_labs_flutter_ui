import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/helpers/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLTextField)
Widget buildLLButtonUseCase(BuildContext context) {
  return LLContainer(
    child: Center(
      child: SizeKnobs(
        child: LLTextField(
          enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
          expands: context.knobs.boolean(label: 'Expands', initialValue: false),
          errorText: context.knobs.boolean(label: 'With error', initialValue: false)
              ? context.knobs.string(label: 'Error text')
              : null,
          hintText: context.knobs.string(label: 'Hint text'),
          maxLength: context.knobs.intOrNull.input(label: 'Max length'),
          maxLines: context.knobs.intOrNull.input(label: 'Max lines'),
          suffixIcon: context.knobs.boolean(label: 'With suffix icon', initialValue: false)
              ? Icon(Icons.close)
              : null,
        ),
      ),
    ),
  );
}

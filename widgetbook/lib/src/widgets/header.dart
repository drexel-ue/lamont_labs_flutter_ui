import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/helpers/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLHeader)
Widget buildLLHeaderUseCase(BuildContext context) {
  return SizeKnobs(
    child: LLContainer(
      child: LLHeader(
        title: Text(
          context.knobs.string(label: 'Title', initialValue: 'Title'),
        ),
        onBackButtonPressed: () {},
        actions: [
          Icon(Icons.abc),
          Icon(Icons.abc),
          Icon(Icons.abc),
          Icon(Icons.abc),
        ],
      ),
    ),
  );
}

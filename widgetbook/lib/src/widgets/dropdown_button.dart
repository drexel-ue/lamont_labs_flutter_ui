import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/helpers/size_knobs.dart';

enum _Option {
  one,
  two,
  three,
  four,
  five,
}

@widgetbook.UseCase(name: 'Default', type: LLDropdownButton)
Widget buildLLDropdownButtonUseCase(BuildContext context) {
  return LLContainer(
    child: Center(
      child: SizeKnobs(
        child: LLDropdownButton<_Option?>(
          items: [
            DropdownMenuItem<_Option>(
              value: null,
              child: Text('All'),
            ),
            for (final option in _Option.values)
              DropdownMenuItem<_Option>(
                value: option,
                child: Text(option.name),
              ),
          ],
          onChanged: (_Option? value) => debugPrint('Dropdown option ($value) selected'),
          hint: Text('Option'),
        ),
      ),
    ),
  );
}

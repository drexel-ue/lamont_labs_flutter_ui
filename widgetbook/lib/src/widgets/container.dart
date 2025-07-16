import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/widgets/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLContainer)
Widget buildLLContainerUseCase(BuildContext context) {
  return const SizeKnobs(
    child: LLContainer(),
  );
}

@widgetbook.UseCase(name: 'Glass', type: LLContainer)
Widget buildGlassLLContainerUseCase(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        child: ColoredBox(
          color: Colors.red,
          child: Center(
            child: Icon(
              Icons.face,
              size: 89,
            ),
          ),
        ),
      ),
      SizeKnobs(
        child: LLContainer.glass(),
      ),
    ],
  );
}

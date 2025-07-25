import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/helpers/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLContainer)
Widget buildLLContainerUseCase(BuildContext context) {
  return const SizeKnobs(
    child: LLContainer(),
  );
}

@widgetbook.UseCase(name: 'Glass', type: LLContainer)
Widget buildGlassLLContainerUseCase(BuildContext context) {
  return SizeKnobs(
    child: Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Icon(
              Icons.face,
              size: 89,
            ),
          ),
        ),
        Positioned.fill(
          child: LLContainer.glass(
            blur: context.knobs.list(
              label: 'Blur Style',
              options: [
                LLBlurStyles.lightBlur,
                LLBlurStyles.mediumBlur,
                LLBlurStyles.heavyBlur,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Adaptive', type: LLContainer)
Widget buildAdaptiveLLContainerUseCase(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        child: Center(
          child: Icon(
            Icons.face,
            size: 89,
          ),
        ),
      ),
      SizeKnobs(
        child: Theme(
          data: Theme.of(context).copyWith(
            platform: context.knobs.listOrNull(
              label: 'Target Platform',
              options: TargetPlatform.values,
            ),
          ),
          child: LLContainer.adaptive(
            blur: context.knobs.list(
              label: 'Blur Style',
              options: [
                LLBlurStyles.lightBlur,
                LLBlurStyles.mediumBlur,
                LLBlurStyles.heavyBlur,
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

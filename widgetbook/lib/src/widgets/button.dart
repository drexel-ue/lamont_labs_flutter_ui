import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/helpers/size_knobs.dart';

void _onTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: LLContainer(
          child: Text('onTap Wow!'),
        ),
      );
    },
  );
}

void _onLongPress(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: LLContainer(
          child: Text('onLongPress Wow!'),
        ),
      );
    },
  );
}

@widgetbook.UseCase(name: 'Default', type: LLButton)
Widget buildLLButtonUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  return SizeKnobs(
    child: LLButton(
      onTap: enabled ? () => _onTap(context) : null,
      onLongPress: enabled ? () => _onLongPress(context) : null,
      child: Text(
        context.knobs.string(
          label: 'Child',
          initialValue: 'Child',
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Glass', type: LLButton)
Widget buildGlassLLButtonUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  return SizeKnobs(
    child: Stack(
      children: [
        Positioned.fill(
          child: LLContainer(
            color: LLColors.darkerMidGrey,
          ),
        ),
        Center(
          child: LLButton.glass(
            onTap: enabled ? () => _onTap(context) : null,
            onLongPress: enabled ? () => _onLongPress(context) : null,
            blur: context.knobs.list(
              label: 'Blur Style',
              options: [
                LLBlurStyles.lightBlur,
                LLBlurStyles.mediumBlur,
                LLBlurStyles.heavyBlur,
              ],
            ),
            child: Text(
              context.knobs.string(
                label: 'Child',
                initialValue: 'Child',
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Adaptive', type: LLButton)
Widget buildAdaptiveLLButtonUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  return Stack(
    children: [
      Positioned.fill(
        child: LLContainer(
          color: LLColors.darkerMidGrey,
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
          child: LLButton.adpative(
            onTap: enabled ? () => _onTap(context) : null,
            onLongPress: enabled ? () => _onLongPress(context) : null,
            blur: context.knobs.list(
              label: 'Blur Style',
              options: [
                LLBlurStyles.lightBlur,
                LLBlurStyles.mediumBlur,
                LLBlurStyles.heavyBlur,
              ],
            ),
            child: Text(
              context.knobs.string(
                label: 'Child',
                initialValue: 'Child',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

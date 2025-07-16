import 'package:flutter/widgets.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/src/widgets/size_knobs.dart';

@widgetbook.UseCase(name: 'Default', type: LLContainer)
Widget buildLLContainerUseCase(BuildContext context) {
  return SizeKnobs(
    child: LLContainer(),
  );
}

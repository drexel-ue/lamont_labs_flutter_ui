// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/src/widgets/container.dart' as _i2;
import 'package:widgetbook_workspace/src/widgets/progress_border.dart' as _i3;
import 'package:widgetbook_workspace/src/widgets/scramble_text.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'LLContainer',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Adaptive',
            builder: _i2.buildAdaptiveLLContainerUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i2.buildLLContainerUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Glass',
            builder: _i2.buildGlassLLContainerUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'LLProgressBorder',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i3.buildLLProgressBorderUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Static Progress',
            builder: _i3.buildStaticLLProgressBorderUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'LLScrambleText',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i4.buildLLScramleTextUseCase,
        ),
      ),
    ],
  ),
];

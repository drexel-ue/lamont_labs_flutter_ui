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
import 'package:widgetbook_workspace/src/widgets/button.dart' as _i3;
import 'package:widgetbook_workspace/src/widgets/container.dart' as _i4;
import 'package:widgetbook_workspace/src/widgets/countdown_timer.dart' as _i5;
import 'package:widgetbook_workspace/src/widgets/header.dart' as _i6;
import 'package:widgetbook_workspace/src/widgets/progress_border.dart' as _i7;
import 'package:widgetbook_workspace/src/widgets/scramble_text.dart' as _i8;
import 'package:widgetbook_workspace/src/widgets/text_field.dart' as _i9;
import 'package:widgetbook_workspace/src/widgets/typography.dart' as _i2;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookLeafComponent(
    name: 'LLTheme',
    useCase: _i1.WidgetbookUseCase(
      name: 'Default',
      builder: _i2.buildLLTypography,
    ),
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'LLButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Adaptive',
            builder: _i3.buildAdaptiveLLButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i3.buildLLButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Glass',
            builder: _i3.buildGlassLLButtonUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'LLContainer',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Adaptive',
            builder: _i4.buildAdaptiveLLContainerUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i4.buildLLContainerUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Glass',
            builder: _i4.buildGlassLLContainerUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'LLCountdownTimer',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i5.buildLLCountdownTimerUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'LLHeader',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i6.buildLLHeaderUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Sliver',
            builder: _i6.buildSliverLLHeaderUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'LLProgressBorder',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i7.buildLLProgressBorderUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Static Progress',
            builder: _i7.buildStaticLLProgressBorderUseCase,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'LLScrambleText',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i8.buildLLScramleTextUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'LLTextField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i9.buildLLButtonUseCase,
        ),
      ),
    ],
  ),
];

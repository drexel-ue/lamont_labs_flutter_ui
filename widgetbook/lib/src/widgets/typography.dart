import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: LLTheme)
Widget buildLLTypography(BuildContext context) {
  final theme = LLTheme.textTheme;
  final text = context.knobs.string(label: 'Text', initialValue: 'Test text');
  return LLContainer(
    child: Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          _TypographyTile(
            title: 'Display large',
            text: text,
            style: theme.displayLarge!,
          ),
          _TypographyTile(
            title: 'Display medium',
            text: text,
            style: theme.displayMedium!,
          ),
          _TypographyTile(
            title: 'Display Small',
            text: text,
            style: theme.displaySmall!,
          ),
          _TypographyTile(
            title: 'Headline large',
            text: text,
            style: theme.headlineLarge!,
          ),
          _TypographyTile(
            title: 'Headline medium',
            text: text,
            style: theme.headlineMedium!,
          ),
          _TypographyTile(
            title: 'Headline Small',
            text: text,
            style: theme.headlineSmall!,
          ),
          _TypographyTile(
            title: 'Title large',
            text: text,
            style: theme.titleLarge!,
          ),
          _TypographyTile(
            title: 'Title medium',
            text: text,
            style: theme.titleMedium!,
          ),
          _TypographyTile(
            title: 'Title Small',
            text: text,
            style: theme.titleSmall!,
          ),
          _TypographyTile(
            title: 'Body large',
            text: text,
            style: theme.bodyLarge!,
          ),
          _TypographyTile(
            title: 'Body medium',
            text: text,
            style: theme.bodyMedium!,
          ),
          _TypographyTile(
            title: 'Body Small',
            text: text,
            style: theme.bodySmall!,
          ),
          _TypographyTile(
            title: 'Label large',
            text: text,
            style: theme.labelLarge!,
          ),
          _TypographyTile(
            title: 'Label medium',
            text: text,
            style: theme.labelMedium!,
          ),
          _TypographyTile(
            title: 'Label Small',
            text: text,
            style: theme.labelSmall!,
          ),
        ],
      ),
    ),
  );
}

class _TypographyTile extends StatelessWidget {
  const _TypographyTile({
    required this.title,
    required this.text,
    required this.style,
  });

  final String title;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return LLContainer(
      padding: allPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: LLTheme.textTheme.headlineLarge,
          ),
          verticalMargin8,
          Text(
            '$text (${style.fontSize})',
            style: style,
          ),
        ],
      ),
    );
  }
}

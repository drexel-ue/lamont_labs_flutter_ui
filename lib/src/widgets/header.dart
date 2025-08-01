import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';

class LLHeader extends StatelessWidget {
  const LLHeader({
    super.key,
    required this.title,
    this.onBackButtonPressed,
    this.actions,
    this.withDivider = false,
    this.dividerPadding = emptyPadding,
  });

  static Widget sliver({
    Key? key,
    required Widget title,
    VoidCallback? onBackButtonPressed,
    List<Widget>? actions,
    bool withDivider = false,
    EdgeInsetsGeometry dividerPadding = emptyPadding,
  }) {
    return SliverToBoxAdapter(
      child: LLHeader(
        key: key,
        title: title,
        onBackButtonPressed: onBackButtonPressed,
        actions: actions,
        withDivider: withDivider,
        dividerPadding: dividerPadding,
      ),
    );
  }

  final Widget title;
  final VoidCallback? onBackButtonPressed;
  final List<Widget>? actions;
  final bool withDivider;
  final EdgeInsetsGeometry dividerPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTheme.merge(
          data: LLTheme.iconTheme,
          child: Row(
            children: [
              if (Navigator.canPop(context) || onBackButtonPressed != null) ...[

                InkWell(
                  onTap: onBackButtonPressed ?? () => Navigator.pop(context),
                  child: SizedBox.square(
                    dimension: 48.0,
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: LLColors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                horizontalMargin8,
              ],
              Expanded(
                child: DefaultTextStyle.merge(
                  style: LLTheme.textTheme.titleLarge,
                  child: title,
                ),
              ),
              horizontalMargin8,
              ...?actions,
            ],
          ),
        ),
        if (withDivider)
          Padding(
            padding: dividerPadding,
            child: Divider(
              thickness: 1.5,
              height: 1.5,
              color: LLColors.white,
            ),
          ),
      ],
    );
  }
}

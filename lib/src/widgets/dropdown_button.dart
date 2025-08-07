import 'package:flutter/material.dart';
import 'package:lamont_labs_flutter_ui/src/colors.dart';
import 'package:lamont_labs_flutter_ui/src/theme.dart';

class LLDropdownButton<T> extends StatelessWidget {
  const LLDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint,
    this.enabled = true,
  });

  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final Widget? hint;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: LLColors.white, width: 1.5),
      borderRadius: BorderRadius.zero,
    );
    return DropdownButtonFormField<T>(
      items: items,
      onChanged: onChanged,
      hint: hint,
      style: LLTheme.textTheme.labelLarge,
      dropdownColor: LLColors.black,
      elevation: 0,
      icon: Icon(Icons.keyboard_arrow_down),
      iconEnabledColor: LLColors.white,
      iconDisabledColor: LLColors.darkerMidGrey,
      isExpanded: true,
      decoration: InputDecoration(
        enabled: enabled,
        fillColor: LLColors.black,
        filled: true,
        border: border,
        enabledBorder: border,
        errorBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: LLColors.red),
        ),
        disabledBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: LLColors.darkerMidGrey),
        ),
        focusedBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(width: 2.0),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(
            color: LLColors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

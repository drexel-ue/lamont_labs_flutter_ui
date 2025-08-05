import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/lamont_labs_flutter_ui.dart';

class LLTextField extends StatelessWidget {
  const LLTextField({
    super.key,
    this.controller,
    this.node,
    this.hint,
    this.hintText,
    this.enabled = true,
    this.expands = false,
    this.maxLines,
    this.maxLength,
    this.error,
    this.errorText,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? node;
  final Widget? hint;
  final String? hintText;
  final bool enabled;
  final bool expands;
  final int? maxLines;
  final int? maxLength;
  final Widget? error;
  final String? errorText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: LLColors.white,
        width: 1.5,
      ),
    );
    return TextSelectionTheme(
      data: TextSelectionTheme.of(context).copyWith(
        selectionColor: LLColors.white.withValues(alpha: 0.3),
        selectionHandleColor: LLColors.white,
        cursorColor: LLColors.white,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: node,
        enabled: enabled,
        expands: expands,
        maxLines: maxLines,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: LLColors.white,
        cursorErrorColor: LLColors.red,
        cursorOpacityAnimates: true,
        cursorWidth: 8.0,
        cursorRadius: Radius.zero,
        style: GoogleFonts.oxanium(color: LLColors.white),
        decoration: InputDecoration(
          fillColor: LLColors.black,
          filled: true,
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(
              width: 2.0,
            ),
          ),
          disabledBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(
              color: LLColors.white.withValues(alpha: 0.5),
            ),
          ),
          error: error,
          errorText: errorText,
          errorBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(
              color: LLColors.red,
            ),
          ),
          errorStyle: GoogleFonts.oxanium(color: LLColors.red),
          hint: hint,
          hintText: hintText,
          hintStyle: TextStyle(
            color: LLColors.white.withValues(alpha: 0.5),
          ),
          counterStyle: GoogleFonts.oxanium(
            color: LLColors.white.withValues(alpha: enabled ? 1.0 : 0.5),
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: rightPadding8,
                  child: suffixIcon,
                )
              : null,
          suffixIconColor: LLColors.white,
          suffixIconConstraints: BoxConstraints(
            maxWidth: 24.0 + 8.0,
            maxHeight: 24.0,
          ),
        ),
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        validator: validator,
      ),
    );
  }
}

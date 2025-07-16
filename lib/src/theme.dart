import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/src/colors.dart';

ThemeData generateTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: LLColors.black,
    surface: LLColors.black,
    primary: LLColors.white,
  );
  const borderSide = BorderSide(color: LLColors.white, width: 2.0);
  return ThemeData(
    useMaterial3: true,
    iconTheme: const IconThemeData(color: LLColors.white),
    textTheme: GoogleFonts.oxaniumTextTheme().apply(
      bodyColor: LLColors.white,
      displayColor: LLColors.white,
      decorationColor: LLColors.white,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: LLColors.white,
      textColor: LLColors.white,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: colorScheme,
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        animationDuration: Duration.zero,
        elevation: const WidgetStatePropertyAll(0.0),
        side: const WidgetStatePropertyAll(borderSide),
        shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
        backgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return LLColors.white;
          }
          return LLColors.black;
        }),
        foregroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return LLColors.black;
          }
          return LLColors.white;
        }),
      ),
    ),
    colorScheme: colorScheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: LLColors.white,
      selectionHandleColor: LLColors.white,
      selectionColor: LLColors.white.withValues(alpha: 0.12),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      // textStyle: TextStyle(color:LLColors.white),
      inputDecorationTheme: InputDecorationTheme(
        iconColor: LLColors.white,
        suffixIconColor: LLColors.white,
      ),
      menuStyle: MenuStyle(
        elevation: WidgetStatePropertyAll(0.0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: borderSide,
          ),
        ),
        maximumSize: WidgetStatePropertyAll(Size.fromWidth(200.0)),
        backgroundColor: WidgetStatePropertyAll(LLColors.black),
        alignment: Alignment.bottomLeft,
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      textColor: LLColors.white,
      collapsedTextColor: LLColors.white,
      iconColor: LLColors.white,
      collapsedIconColor: LLColors.white,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      shape: const Border(),
      expansionAnimationStyle: AnimationStyle(curve: Curves.easeOut),
      expandedAlignment: Alignment.topLeft,
    ),
    splashFactory: NoSplash.splashFactory,
  );
}

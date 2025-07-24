import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/src/colors.dart';

class LLTheme {
  const LLTheme._();

  static final textTheme = GoogleFonts.oxaniumTextTheme().apply(
    bodyColor: LLColors.white,
    displayColor: LLColors.white,
    decorationColor: LLColors.white,
  );

  static ThemeData merge(BuildContext context) {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: LLColors.white,
        onPrimary: LLColors.black,
        surface: LLColors.black,
        onSurface: LLColors.white,
      ),
      textTheme: textTheme,
      canvasColor: LLColors.darkerMidGrey,
      cardColor: LLColors.darkerMidGrey,
    );
  }

  static const defaultAnimationDuration = Duration(milliseconds: 250);
}

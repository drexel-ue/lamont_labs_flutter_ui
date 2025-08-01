import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamont_labs_flutter_ui/src/colors.dart';

class LLTheme {
  const LLTheme._();

  static final textTheme =
      GoogleFonts.oxaniumTextTheme(
        TextTheme(
          // As the largest text on the screen, display styles are reserved for short, important text or numerals. They work best on large screens.
          displayLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 57.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 45.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 36.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          // Headlines are best-suited for short, high-emphasis text on smaller screens. These styles can be good for marking primary passages of text or important regions of content.
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 32.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          // Titles are smaller than headline styles, and should be used for medium-emphasis text that remains relatively short. For example, consider using title styles to divide secondary passages of text or secondary regions of content.
          titleLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          // Body styles are used for longer passages of text in your app.
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          // Label styles are smaller, utilitarian styles, used for things like the text inside components or for very small text in the content body, such as captions. Buttons, for example, use the label large style.
          labelLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 11.0,
            color: LLColors.white,
            decorationColor: LLColors.white,
          ),
        ),
      ).apply(
    bodyColor: LLColors.white,
    displayColor: LLColors.white,
    decorationColor: LLColors.white,
  );

  static const iconTheme = IconThemeData(
    color: LLColors.white,
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

import 'dart:ui';

class LLBlurStyles {
  const LLBlurStyles._();

  static const light = 5.0;
  static const medium = 10.0;
  static const heavy = 15.0;

  static final lightBlur = ImageFilter.blur(sigmaX: light, sigmaY: light);
  static final mediumBlur = ImageFilter.blur(sigmaX: medium, sigmaY: medium);
  static final heavyBlur = ImageFilter.blur(sigmaX: heavy, sigmaY: heavy);
}

import 'package:flutter/material.dart';

class AppFonts {
  static const String arabic = 'NotoKufiArabic';
  static const String english = 'Inter';

  static const String defaultFont = english;

  static String getFontFamily(BuildContext context) {
    try {
      final locale = Localizations.localeOf(context);
      return locale.languageCode == 'ar' ? arabic : english;
    } catch (e) {
      return defaultFont;
    }
  }

  static TextStyle createTextStyle(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: getFontFamily(context),
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }

  static TextStyle createDefaultTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: defaultFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }
}

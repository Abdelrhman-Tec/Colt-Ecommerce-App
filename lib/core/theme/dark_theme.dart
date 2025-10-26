import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class DarkTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: AppFonts.getFontFamily(context),

    iconTheme: const IconThemeData(),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      titleTextStyle: AppFonts.createTextStyle(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
    ),

    textTheme: TextTheme(
      displayLarge: AppFonts.createTextStyle(
        context,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.darkTextPrimary,
        height: 1.2,
      ),
      displayMedium: AppFonts.createTextStyle(
        context,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        height: 1.3,
      ),
      displaySmall: AppFonts.createTextStyle(
        context,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        height: 1.3,
      ),
      headlineMedium: AppFonts.createTextStyle(
        context,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        height: 1.4,
      ),
      headlineSmall: AppFonts.createTextStyle(
        context,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
        height: 1.4,
      ),
      titleLarge: AppFonts.createTextStyle(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
        height: 1.5,
      ),
      bodyLarge: AppFonts.createTextStyle(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextPrimary,
        height: 1.6,
      ),
      bodyMedium: AppFonts.createTextStyle(
        context,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextSecondary,
        height: 1.6,
      ),
      labelLarge: AppFonts.createTextStyle(
        context,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        height: 1.4,
      ),
      bodySmall: AppFonts.createTextStyle(
        context,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextSecondary,
        height: 1.6,
      ),
      labelSmall: AppFonts.createTextStyle(
        context,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextSecondary,
        height: 1.6,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppFonts.createTextStyle(
        context,
        color: AppColors.darkTextSecondary,
      ),
      labelStyle: AppFonts.createTextStyle(
        context,
        color: AppColors.darkTextSecondary,
      ),
      errorStyle: AppFonts.createTextStyle(
        context,
        fontSize: 12,
        color: Colors.red,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppFonts.createTextStyle(
          context,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppFonts.createTextStyle(
          context,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}

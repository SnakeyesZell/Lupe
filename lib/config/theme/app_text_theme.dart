
import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

abstract class AppTextTheme 
{
  static TextTheme lightTextTheme = TextTheme(

    // === TITLES ===
    titleLarge: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.titleLarge,
      fontFamily: AppFonts.quicksandBold,
    ),
    titleMedium: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.titleMedium,
      fontFamily: AppFonts.quicksandBold,
    ),
    titleSmall: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.titleSmall,
      fontFamily: AppFonts.quicksandBold,
    ),

    // === LABELS ===
    labelLarge: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.labelLarge,
      fontFamily: AppFonts.quicksandSemiBold,
    ),
    labelMedium: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.labelMedium,
      fontFamily: AppFonts.quicksandSemiBold,
    ),
    labelSmall: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.labelSmall,
      fontFamily: AppFonts.quicksandSemiBold,
    ),

    // === BODY ===
    bodyLarge: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.bodyLarge,
      fontFamily: AppFonts.quicksandRegular,
    ),
    bodyMedium: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.bodyMedium,
      fontFamily: AppFonts.quicksandRegular,
    ),
    bodySmall: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: AppFontSizes.bodySmall,
      fontFamily: AppFonts.quicksandRegular,
    ),
  );
}

abstract class AppFontSizes 
{
  // === TITLES ===
  static const double titleLarge  = 36;
  static const double titleMedium = 30;
  static const double titleSmall  = 26;

  // === LABELS ===
  static const double labelLarge  = 28;
  static const double labelMedium = 24;
  static const double labelSmall  = 20;

  // === BODY ===
  static const double bodyLarge  = 18;
  static const double bodyMedium = 16;
  static const double bodySmall  = 14;  
}


import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

abstract class AppTextTheme 
{
  static TextTheme lightTextTheme = TextTheme(

    // === TITLES ===
    titleLarge: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.titleLarge,
      fontFamily: AppFonts.quicksandBold,
    ),
    titleMedium: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.titleMedium,
      fontFamily: AppFonts.quicksandBold,
    ),
    titleSmall: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.titleSmall,
      fontFamily: AppFonts.quicksandBold,
    ),

    // === LABELS ===
    labelLarge: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.labelLarge,
      fontFamily: AppFonts.quicksandSemiBold,
    ),
    labelMedium: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.labelMedium,
      fontFamily: AppFonts.quicksandSemiBold,
    ),
    labelSmall: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.labelSmall,
      fontFamily: AppFonts.quicksandSemiBold,
    ),

    // === BODY ===
    bodyLarge: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.bodyLarge,
      fontFamily: AppFonts.quicksandRegular,
    ),
    bodyMedium: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.bodyMedium,
      fontFamily: AppFonts.quicksandRegular,
    ),
    bodySmall: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: _FontSizes.bodySmall,
      fontFamily: AppFonts.quicksandRegular,
    ),
  );
}

abstract class _FontSizes 
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

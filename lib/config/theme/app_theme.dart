
import 'package:flutter/material.dart';
import 'package:lupe/config/theme/app_text_theme.dart';

abstract class AppTheme 
{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffedf0f5),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xffedf0f5)),
    primaryColor: const Color(0xff3aaff6),
    colorScheme: const ColorScheme(
      brightness: Brightness.light, 
      primary: Color(0xff3aaff6), 
      onPrimary: Colors.white, 
      secondary: Color(0xff102542), 
      onSecondary: Colors.white, 
      error: Colors.redAccent, 
      onError: Colors.redAccent, 
      background: Color(0xffedf0f5),
      onBackground: Color(0xffFF5E5B), 
      surface: Colors.white, 
      onSurface: Colors.white,
    ),
    cardColor: Colors.white,
    shadowColor: Colors.grey,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    
  );
}


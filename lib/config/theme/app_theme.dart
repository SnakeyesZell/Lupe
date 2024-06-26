
import 'package:flutter/material.dart';
import 'package:lupe/config/theme/app_text_theme.dart';

abstract class AppTheme 
{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffedf0f5),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xffedf0f5)),
    primaryColor: const Color(0xff3aaff6),
    cardColor: Colors.white,
    shadowColor: Colors.grey,
    hintColor: Colors.grey,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    
  );
}


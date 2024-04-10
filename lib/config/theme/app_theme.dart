
import 'package:flutter/material.dart';
import 'package:lupe/config/theme/app_text_theme.dart';

abstract class AppTheme 
{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffedf0f5),
    primaryColor: const Color(0xfffee600),
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    
  );
}


// theme/utils/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

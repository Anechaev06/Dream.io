import 'package:dreamio/utils/constants/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    primaryColor: AppPalette.primaryColor,
    scaffoldBackgroundColor: AppPalette.bgColor,
    colorScheme: const ColorScheme.dark(
      primary: AppPalette.primaryColor,
      secondary: AppPalette.secondaryColor,
      background: AppPalette.bgColor,
    ),
    textTheme: GoogleFonts.ubuntuTextTheme(ThemeData.dark().textTheme),
  );
}

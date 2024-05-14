import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.ubuntuTextTheme(ThemeData.dark().textTheme),
  );
}

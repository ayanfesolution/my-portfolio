import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_settings/injector.dart';

class MyPortfolioUpdateThemeData {
  static final lightMode = ThemeData(
    scaffoldBackgroundColor: injector.palette.pureWhite,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      bodyMedium: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      bodySmall: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      displayMedium: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      displaySmall: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      headlineLarge: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      headlineMedium: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      headlineSmall: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      labelLarge: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      labelMedium: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      labelSmall: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      titleLarge: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      titleMedium: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
      titleSmall: GoogleFonts.inter(
        color: injector.palette.textColor,
      ),
    ),

    brightness: Brightness.light,
    primaryColor: injector.palette.primaryColor,
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: injector.palette.primaryColor,
    // ),
    useMaterial3: true,
    //  accentColor: Colors.orange,
  );

  static final darkMode = ThemeData(
    scaffoldBackgroundColor: injector.palette.darkModeBackground,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      bodyLarge: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      bodyMedium: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      bodySmall: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      displayMedium: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      displaySmall: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      headlineLarge: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      headlineMedium: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      headlineSmall: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      labelLarge: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      labelMedium: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      labelSmall: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      titleLarge: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      titleMedium: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
      titleSmall: GoogleFonts.inter(
        color: injector.palette.pureWhite,
      ),
    ),

    fontFamily: GoogleFonts.inter().fontFamily,

    brightness: Brightness.dark,
    primaryColor: injector.palette.primaryColor,
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: injector.palette.primaryColor,
    // ),
    useMaterial3: true,
    //  accentColor: Colors.orange,
  );
}

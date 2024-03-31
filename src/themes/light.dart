import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/colors.dart';

final appLightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.instance.white,
  useMaterial3: true,
  primarySwatch: AppColors.instance.primaryWhite,
  //! TextTheme
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.manrope(
      fontSize: 28,
      color: AppColors.instance.black,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: GoogleFonts.manrope(
      fontSize: 14,
      color: AppColors.instance.grey,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.instance.black,
    ),
    displayLarge: GoogleFonts.manrope(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: AppColors.instance.black,
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.instance.black,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: AppColors.instance.white,
  ),
);

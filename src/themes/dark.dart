import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/colors.dart';

final appDarkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  useMaterial3: true,
  primarySwatch: AppColors.instance.primaryBlack,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.manrope(
      fontSize: 28,
      color: AppColors.instance.white,
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
      color: AppColors.instance.white,
    ),
    displayLarge: GoogleFonts.manrope(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: AppColors.instance.white,
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.instance.white,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: AppColors.instance.black),
);

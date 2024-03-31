import 'package:flutter/material.dart';

class AppColors {
  static AppColors instance = AppColors();

  final white = const Color(0xffffffff);
  final black = const Color(0xff000000);
  final grey = const Color(0xff808080);
  final red = const Color(0xffFF0000);
  final yellow = const Color(0xffFFFF00);
  final green = const Color(0xff00FF00);

  final MaterialColor primaryBlack = const MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  final MaterialColor primaryWhite = const MaterialColor(
    0xFFffffff,
    <int, Color>{
      50: Color(0xFFffffff),
      100: Color(0xFFffffff),
      200: Color(0xFFffffff),
      300: Color(0xFFffffff),
      400: Color(0xFFffffff),
      500: Color(0xFFffffff),
      600: Color(0xFFffffff),
      700: Color(0xFFffffff),
      800: Color(0xFFffffff),
      900: Color(0xFFffffff),
    },
  );
}

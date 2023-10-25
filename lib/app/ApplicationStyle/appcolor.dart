import 'package:flutter/material.dart';
class AppColors{
static const  PrimaryColorDark = const Color(0xFF661C60);
static const PrimaryColorLight = const Color(0xFFffffff);
static const PrimaryColor = const Color(0xFF86BB71);

static const SecondaryColor = const Color(0xFFBFBBBB);

static const Background = const Color(0xFF661C60);
static const TextColor = const Color(0xFFffffff);
static const TextColor2 = const Color(0xFFBFBBBB);
static const TextColor3 = const Color(0xFF000000);
static const TextColor4 = const Color(0xFF86BB71);
static const TextColor1 = const Color(0xFF707070);
}
class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
     

     
    );
  }
}
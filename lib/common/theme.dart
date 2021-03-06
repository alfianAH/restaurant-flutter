import 'package:flutter/material.dart';
import 'package:restaurant_app/common/colors.dart';
import 'package:restaurant_app/common/text_theme.dart';

/// Theme data for [darkTheme]
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: primaryColorDark,
  primaryColor: primaryColorDark,
  accentColor: secondaryColorDark,
  textTheme: appTextTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);

/// Theme data for [lightTheme]
final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: primaryColorLight,
  primaryColor: primaryColorLight,
  accentColor: secondaryColorLight,
  textTheme: appTextTheme.apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
);

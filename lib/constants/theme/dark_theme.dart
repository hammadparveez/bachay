import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData setDarkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: DarkColors.PRIMARY_BG_COLOR,
      brightness: Brightness.dark,
      focusColor: DarkColors.PRIMARY_COLOR,
      splashColor: DarkColors.PRIMARY_ORIGINAL,
      primaryColor: DarkColors.PRIMARY_COLOR,
      primarySwatch: DarkColors.WHITE,
      backgroundColor: DarkColors.PRIMARY_BG_COLOR,
      accentColor: DarkColors.PRIMARY_COLOR,
      accentTextTheme: TextTheme(button: Style.primaryTextStyle),
      iconTheme: const IconThemeData(color: LightColors.WHITE),
      shadowColor: DarkColors.DARK_LIGHT63,
      buttonTheme: ButtonThemeData(buttonColor: DarkColors.PRIMARY_ORIGINAL),
      cardColor: DarkColors.DARK_LIGHTE3,
      textTheme:
      TextTheme(bodyText1: Style.bodyText1.copyWith(color: DarkColors.DARK_LIGHTE3),
        headline1:  Style.heading1.copyWith(color: DarkColors.DARK_LIGHTE3)
      ),
    );
  }
}

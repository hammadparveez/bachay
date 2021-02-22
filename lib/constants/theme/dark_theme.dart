import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData setLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      focusColor: LightColors.PRIMARY_COLOR,
      splashColor: LightColors.PRIMARY_COLOR,
      primaryColor: LightColors.PRIMARY_COLOR,
      primarySwatch: LightColors.WHITE,
      backgroundColor: LightColors.PRIMARY_BG_COLOR,
      accentColor: LightColors.PRIMARY_COLOR,
      accentTextTheme: TextTheme(button: Style.primaryTextStyle),
      iconTheme: const IconThemeData(color: LightColors.WHITE),
      buttonTheme: ButtonThemeData(
          buttonColor: LightColors.PRIMARY_COLOR,
          textTheme: ButtonTextTheme.primary),
      //primaryTextTheme: TextTheme(),
    );
  }
}

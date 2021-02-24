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
      cardColor: LightColors.DARK_GRAY,
      accentTextTheme: TextTheme(button: Style.primaryTextStyle),
      iconTheme: const IconThemeData(color: LightColors.WHITE),
      shadowColor: LightColors.LIGHT_WHITE_D6,
      textTheme: TextTheme(bodyText1: Style.bodyText1.copyWith(color: LightColors.LIGHT_BLACK26,),
          headline1:  Style.heading1.copyWith(color: LightColors.DARK_GRAY),
    ),
      buttonTheme: ButtonThemeData(
          buttonColor: LightColors.PRIMARY_COLOR,
          textTheme: ButtonTextTheme.primary),
    );
  }
}

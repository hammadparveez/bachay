import 'package:bachay/constants/app_constants.dart';
import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/values.dart';
import 'package:flutter/cupertino.dart';

class Style {
  //App TextStyle
  static const secondaryTextStyle = TextStyle(color: LightColors.SECONDARY_COLOR);
  static const secondaryTextStyleBold = TextStyle(fontWeight: FontWeight.bold,  fontFamily: AppConstants.VOLTE);
  static const primaryTextStyle = TextStyle(fontFamily: AppConstants.VOLTE);
  static const secondaryTextStyleBold400 = TextStyle(color: LightColors.SECONDARY_COLOR, fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const  secondaryTextStyleLight = TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const  secondaryTextStyleLightWhite = TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);

  //ThemeSpecific TextStyle
  static const  bodyText1 = TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const  bodyText2 = TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const heading1 = TextStyle(fontWeight: FontWeight.bold,  fontFamily: AppConstants.VOLTE);


  //App Padding
  static const DEFAULT_PADDING_HZT = EdgeInsets.symmetric(horizontal: Values.VALUE_20);
  static const DEFAULT_PADDING_VRT = EdgeInsets.symmetric(vertical: Values.VALUE_20);
  static const PADDING_HRT_25 = EdgeInsets.symmetric(horizontal: Values.VALUE_25);
  static const PADDING_VRT_25 = EdgeInsets.symmetric(vertical: Values.VALUE_25);
  static const PADDING_HZT_10 = EdgeInsets.symmetric(horizontal: Values.VALUE_10);
  static const PADDING_VRT_10 = EdgeInsets.symmetric(vertical: Values.VALUE_10);
  static const PADDING_HRT_8 = EdgeInsets.symmetric(horizontal: Values.VALUE_8);
  static const PADDING_VRT_8 = EdgeInsets.symmetric(vertical: Values.VALUE_8);

  //App Margin
  static const MARGIN_ALL_25 = EdgeInsets.all(Values.VALUE_25);
  static const MARGIN_ALL_DEFAULT = EdgeInsets.all(Values.VALUE_20);
  static const DEFAULT_MARGIN_HZT = EdgeInsets.symmetric(horizontal: Values.VALUE_20);
  static const DEFAULT_MARGIN_VRT = EdgeInsets.symmetric(vertical: Values.VALUE_20);
  static const MARGIN_HRT_25 = EdgeInsets.symmetric(horizontal: Values.VALUE_25);
  static const MARGIN_VRT_25 = EdgeInsets.symmetric(vertical: Values.VALUE_25);
  static const MARGIN_HZT_10 = EdgeInsets.symmetric(horizontal: Values.VALUE_10);
  static const MARGIN_VRT_10 = EdgeInsets.symmetric(vertical: Values.VALUE_10);
  static const MARGIN_HRT_8 = EdgeInsets.symmetric(horizontal: Values.VALUE_8);
  static const MARGIN_VRT_8 = EdgeInsets.symmetric(vertical: Values.VALUE_8);

  //App Shadow
  static const BOX_SHADOW= [
  BoxShadow(offset: Offset(0, 0), blurRadius: 5, spreadRadius: 0)];

  //Border Radius
 static const BORDER_FULL_RADIUS = BorderRadius.all(Radius.circular(999));

 //BlurRadius
  static const double BLUR_RADIUS10 = 10;
  static const double SPREAD_RADIUS0 = 0;
  static const double BLUR_RADIUS5 = 5;
  static const double SPREAD_RADIUS5 = 5;
  static const double BLUR_RADIUS3 = 3;
  static const double SPREAD_RADIUS3 = 3;
}


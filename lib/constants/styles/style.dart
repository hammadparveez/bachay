import 'package:bachay/constants/app_constants.dart';
import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/values.dart';
import 'package:flutter/cupertino.dart';

class Style {
  //App TextStyle
  static const secondaryTextStyle =const  TextStyle(color: LightColors.SECONDARY_COLOR);
  static const secondaryTextStyleBold = const TextStyle(fontWeight: FontWeight.bold,  fontFamily: AppConstants.VOLTE);
  static const primaryTextStyle = const TextStyle(fontFamily: AppConstants.VOLTE);
  static const secondaryTextStyleBold400 =const  TextStyle(color: LightColors.SECONDARY_COLOR, fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const  secondaryTextStyleLight = const TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const  secondaryTextStyleLightWhite = const TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);

  //ThemeSpecific TextStyle
  static const  bodyText1 = const TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const  bodyText2 = const TextStyle(fontWeight: FontWeight.w400,  fontFamily: AppConstants.VOLTE);
  static const heading1 = const TextStyle(fontWeight: FontWeight.bold,  fontFamily: AppConstants.VOLTE);


  //App Padding
  static const DEFAULT_PADDING_HZT = const EdgeInsets.symmetric(horizontal: Values.VALUE_20);
  static const DEFAULT_PADDING_VRT = const EdgeInsets.symmetric(vertical: Values.VALUE_20);
  static const PADDING_HRT_25 = const EdgeInsets.symmetric(horizontal: Values.VALUE_25);
  static const PADDING_VRT_25 = const EdgeInsets.symmetric(vertical: Values.VALUE_25);
  static const PADDING_HZT_10 = const EdgeInsets.symmetric(horizontal: Values.VALUE_10);
  static const PADDING_VRT_10 = const EdgeInsets.symmetric(vertical: Values.VALUE_10);
  static const PADDING_HRT_8 = const EdgeInsets.symmetric(horizontal: Values.VALUE_8);
  static const PADDING_VRT_8 = const EdgeInsets.symmetric(vertical: Values.VALUE_8);
  static const PADDING_VRT_4 = const EdgeInsets.symmetric(vertical: Values.VALUE_4);
  static const PADDING_ALL_4 = const EdgeInsets.all( Values.VALUE_4);

  //App Margin
  static const MARGIN_ALL_25 = const EdgeInsets.all(Values.VALUE_25);
  static const MARGIN_ALL_DEFAULT = const EdgeInsets.all(Values.VALUE_20);
  static const DEFAULT_MARGIN_HZT = const EdgeInsets.symmetric(horizontal: Values.VALUE_20);
  static const DEFAULT_MARGIN_VRT = const EdgeInsets.symmetric(vertical: Values.VALUE_20);
  static const MARGIN_HRT_25 = const EdgeInsets.symmetric(horizontal: Values.VALUE_25);
  static const MARGIN_VRT_25 = const EdgeInsets.symmetric(vertical: Values.VALUE_25);
  static const MARGIN_HZT_10 = const EdgeInsets.symmetric(horizontal: Values.VALUE_10);
  static const MARGIN_VRT_10 = const EdgeInsets.symmetric(vertical: Values.VALUE_10);
  static const MARGIN_HRT_8 = const EdgeInsets.symmetric(horizontal: Values.VALUE_8);
  static const MARGIN_VRT_8 =const  EdgeInsets.symmetric(vertical: Values.VALUE_8);
  static const MARGIN_ALL_4 = const EdgeInsets.all( Values.VALUE_4);

  //App Shadow
  static const BOX_SHADOW= const [
    const BoxShadow(offset: Offset(0, 0), blurRadius: 5, spreadRadius: 0)];

  //Border Radius
 static const BORDER_FULL_RADIUS =const  BorderRadius.all(Radius.circular(999));
  static const BORDER_LEFT_FULL_RADIUS = const BorderRadius.horizontal(left: Radius.circular(999));
  static const BORDER_RIGHT_FULL_RADIUS = const BorderRadius.horizontal(right: Radius.circular(999));
  static const BORDER_BOTTOM_2SIDE_RADIUS = const  BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight:  Radius.circular(20));
 //BlurRadius
  static const double BLUR_RADIUS10 = 10;
  static const double SPREAD_RADIUS0 = 0;
  static const double BLUR_RADIUS5 = 5;
  static const double SPREAD_RADIUS5 = 5;
  static const double BLUR_RADIUS3 = 3;
  static const double SPREAD_RADIUS3 = 3;
}


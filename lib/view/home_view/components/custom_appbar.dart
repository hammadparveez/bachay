import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:bachay/responsive_ext.dart';
class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: Style.PADDING_ALL_4.copyWith(left: Values.VALUE_20),
      decoration: BoxDecoration(
        color: LightColors.PRIMARY_COLOR,
        borderRadius: Style.BORDER_BOTTOM_2SIDE_RADIUS,
      ),
      width: context.responsive.widgetScaleFactor * 100,
      height: context.responsive.widgetScaleFactor * 7.5,
      child: Image.asset(Images.logo, color: Colors.white),
    );
  }
}

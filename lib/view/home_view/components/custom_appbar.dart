import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Images.logo, color: Colors.white),
          ThemeChangerWidget(),
        ],
      ),
    );
  }
}

class ThemeChangerWidget extends StatefulWidget {
  @override
  _ThemeChangerWidgetState createState() => _ThemeChangerWidgetState();
}

class _ThemeChangerWidgetState extends State<ThemeChangerWidget> {
  ThemeStatus status = ThemeStatus.LIGHT;
  @override
  Widget build(BuildContext context) {
    return   Consumer(builder:(_, watch, child) {
      return IconButton(icon: Icon(status == ThemeStatus.LIGHT ? Icons.wb_sunny_outlined : Icons.wb_sunny_sharp ), onPressed: () {
      if(status == ThemeStatus.LIGHT)
        status = ThemeStatus.DARK;
      else
        status = ThemeStatus.LIGHT;
      watch(themeProvider).updateTheme(status);
    }
      ); }
      );
  }
}

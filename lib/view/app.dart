import 'package:bachay/constants/strings.dart';
import 'package:bachay/constants/theme/light_theme.dart';
import 'package:bachay/view/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.APP_NAME,
      theme: LightTheme.setLightTheme(),
      home: HomeView(),
    );
  }
}

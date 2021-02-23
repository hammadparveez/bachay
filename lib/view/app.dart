import 'package:bachay/constants/strings.dart';
import 'package:bachay/constants/theme/dark_theme.dart';
import 'package:bachay/constants/theme/light_theme.dart';
import 'package:bachay/routes/routes.dart';
import 'package:bachay/view/home_view/home_view.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class App extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final currentTheme = watch(themeProvider);
    ThemeData _mode;
    return GetMaterialApp(
      theme: currentTheme.themeData,
      title: Strings.APP_NAME,
      routes: routes,
      initialRoute: Routes.SPLASH,
    );
  }
}

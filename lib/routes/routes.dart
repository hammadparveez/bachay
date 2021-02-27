import 'package:bachay/view/home_view/home_view.dart';
import 'package:bachay/view/on_board/on_board_view.dart';
import 'package:bachay/view/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String HOME = "home";
  static const String ON_BOARD = "on_board";
  static const String SPLASH = "splash";
}

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.HOME: (_) => HomeView(key: ModalRoute.of(_).settings.arguments),
  Routes.ON_BOARD: (_) => OnBoardView(),
  Routes.SPLASH: (_) => SplashView(),
};
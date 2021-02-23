import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/view/home_view/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static double positionValue = Get.width / 2;
  static final _tween = Tween(begin: 0.0, end: positionValue);

  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: Style.DEFAULT_PADDING_HZT,
        child: HomeBody(),
      ),
    );
  }
}

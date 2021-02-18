import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveConfig {
  Orientation _orientation;
  double _deviceWidth, _deviceHeight, _widgetScaleFactor, _textScaleFactor;

  ResponsiveConfig.init() {
    this._orientation = Get.mediaQuery.orientation;
    this._deviceHeight = Get.height;
    this._deviceWidth = Get.width;
    _widgetScaleFactor =
        (_orientation == Orientation.portrait) ? Get.height : Get.width;
  }
}

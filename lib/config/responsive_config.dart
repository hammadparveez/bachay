import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveConfig {
  Orientation _orientation;
  double _deviceWidth, _deviceHeight, _widgetScaleFactor, _textScaleFactor;

  Orientation get orientation => _orientation;

  ResponsiveConfig.init() {
    this._orientation = Get.mediaQuery.orientation;
    this._deviceHeight = Get.height;
    this._deviceWidth = Get.width;
    _widgetScaleFactor =
        (_orientation == Orientation.portrait) ? Get.height : Get.width;
  }

  double get deviceWidth => _deviceWidth;

  double get deviceHeight => _deviceHeight;

  double get widgetScaleFactor => _widgetScaleFactor;

  double get textScaleFactor => _textScaleFactor;
}

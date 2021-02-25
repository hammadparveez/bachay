import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveConfig {
  Orientation _orientation;
  double _deviceWidth,
      _deviceHeight,
      _deviceBlockWidth,
      _deviceBlockHeight,
      _widgetScaleFactor,
      _textScaleFactor;

  Orientation get orientation => _orientation;

  ResponsiveConfig.init() {
    this._orientation = Get.mediaQuery.orientation;
    this._deviceHeight = Get.height;
    this._deviceWidth = Get.width;
    this._deviceBlockWidth = Get.width / 100;
    this._deviceBlockHeight = Get.height / 100;
    _widgetScaleFactor = (_orientation == Orientation.portrait)
        ? _deviceBlockHeight
        : _deviceBlockWidth;
    _textScaleFactor = _widgetScaleFactor;
  }

  double get deviceBlockWidth => _deviceBlockWidth;

  double get deviceWidth => _deviceWidth;

  double get deviceHeight => _deviceHeight;

  double get widgetScaleFactor => _widgetScaleFactor;

  double get textScaleFactor => _textScaleFactor;

  get deviceBlockHeight => _deviceBlockHeight;
}

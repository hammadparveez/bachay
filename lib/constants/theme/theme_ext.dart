import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeExtention on  BuildContext {
  ThemeData get themeData  => Theme.of(this);
}
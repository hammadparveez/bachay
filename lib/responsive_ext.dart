import 'package:bachay/config/responsive_config.dart';
import 'package:flutter/cupertino.dart';

extension ResponsiveExt on BuildContext {
  ResponsiveConfig get responsive => ResponsiveConfig.init();
}

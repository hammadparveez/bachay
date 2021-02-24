import 'package:bachay/config/di/setup.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/constants/prefrences_keys.dart';
import 'package:bachay/constants/theme/dark_theme.dart';
import 'package:bachay/constants/theme/light_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider<ThemeProvider>((ref) => ThemeProvider());
class ThemeProvider extends ChangeNotifier {
  final _pref = getIt.get<SharedPreferences>();
  ThemeStatus _themeStatus;
  ThemeData _themeData;

  ThemeData get themeData {
    String currentMode;
    if(_pref.containsKey(Pref.THEME_MODE)) {
      currentMode = _pref.get(Pref.THEME_MODE);
      if (currentMode == Pref.LIGHT) {
        _themeData = _setLightTheme();
        _themeStatus = ThemeStatus.LIGHT;
      } else {
        _themeData = _setDarkTheme();
        _themeStatus = ThemeStatus.DARK;
      }
    }else {

        _themeData = _setLightTheme();
        _themeStatus = ThemeStatus.LIGHT;

    }

    return _themeData;
  }

    ThemeStatus get themeStatus => _themeStatus;
    //Update Theme by status
    updateTheme(ThemeStatus status) {
      _themeStatus = status;
        if(status == ThemeStatus.LIGHT) {
          _pref.setString(Pref.THEME_MODE, Pref.LIGHT);
          _themeData = _setLightTheme();
        }
        else {
          _pref.setString(Pref.THEME_MODE, Pref.DARK);
          _themeData = _setDarkTheme();
        }
      notifyListeners();
    }
    //set Theme
    ThemeData _setLightTheme() => LightTheme.setLightTheme();

    ThemeData _setDarkTheme() =>
        DarkTheme.setDarkTheme();

}



import 'package:bachay/config/di/setup.dart';
import 'package:bachay/constants/prefrences_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final onBoardProvider = ChangeNotifierProvider((ref) => OnBoardNotifier());
class OnBoardNotifier extends ChangeNotifier {
  final _pref = getIt.get<SharedPreferences>();
  bool _isSeen = false;

  void setOnBoardSeen(bool isSeen) {
    _isSeen = isSeen;
    _pref.setBool(Pref.KEY_ON_BOARD_SEEN, true);
    notifyListeners();
  }
  bool isOnBoardSeen() {
    if(_pref.containsKey(Pref.KEY_ON_BOARD_SEEN))
      return true;
    return false;
  }

}
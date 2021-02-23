import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = ChangeNotifierProvider.autoDispose((ref) {
  return SplashProvider();
});
class SplashProvider extends ChangeNotifier {
  int length = 3;
  PageController _pageController = PageController();
  PageController get pageController => _pageController;



  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
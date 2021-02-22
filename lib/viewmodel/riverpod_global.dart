import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends ChangeNotifier {
  String value = "";
  void update(String value) {
    this.value = value;
    notifyListeners();
  }

  String getState() => value;
}

final helloRiverPod = ChangeNotifierProvider<Counter>((ref) => Counter());

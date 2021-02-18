import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloRiverPod = Provider((ref) {
  print("Hello World Provider Reference");
  return "Awesome bro";
});

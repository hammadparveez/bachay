import 'package:bachay/viewmodel/riverpod_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final value = watch(helloRiverPod);
    return Scaffold(
      body: Center(
        child: Text("Hello World ${value}"),
      ),
    );
  }
}

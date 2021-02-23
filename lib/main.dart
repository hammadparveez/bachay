import 'package:bachay/config/di/setup.dart';
import 'package:bachay/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(ProviderScope(child: App()));
}

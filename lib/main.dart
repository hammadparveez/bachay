import 'package:bachay/config/di/setup.dart';
import 'package:bachay/view/app.dart';
import 'package:bachay/view/home_view/components/camera_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraKey = GlobalKey<CameraPreviewWidgetState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(ProviderScope(child: App()));
}

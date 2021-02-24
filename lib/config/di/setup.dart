//Dependency Injection by Get It
import 'package:camera/camera.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setup () async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(await availableCameras());
}
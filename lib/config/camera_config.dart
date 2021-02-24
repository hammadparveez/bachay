import 'package:bachay/config/di/setup.dart';
import 'package:camera/camera.dart';

class CameraConfig {
  final _cameraDescription = getIt.get<List<CameraDescription>>();
  List<CameraDescription> get cameraDescription => _cameraDescription;
  String _cameraErrorMsg = "";
  Future<CameraController> init(CameraDescription cameraDescription, ResolutionPreset resolutionPreset) async {
    try {
      final _cameraController = CameraController(cameraDescription, ResolutionPreset.max);
      await _cameraController.initialize();
  return _cameraController;
    } catch(error){
      throw CameraException("408", "Camera cannot be launched");
    }
  }

  String get cameraErrorMsg => _cameraErrorMsg;
}
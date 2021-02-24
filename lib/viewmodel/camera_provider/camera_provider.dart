import 'package:bachay/config/camera_config.dart';
import 'package:bachay/config/di/setup.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraProvider = ChangeNotifierProvider((ref) => CameraNotifier());
class CameraNotifier extends ChangeNotifier {
  final _cameraConfig = CameraConfig();
  bool _isCameraOpen = false;



  List<CameraDescription> get cameraDescriptions => _cameraConfig.cameraDescription;
  CameraController _cameraController ;


  String _cameraErrorMsg = "";
  initCamera(CameraDescription cameraDescription, ResolutionPreset resolutionPreset) async {
    try {
     _cameraController = await _cameraConfig.init(cameraDescription, resolutionPreset);
    }catch(e) {
      _cameraErrorMsg = "Camera cannot be opened";
    }
    notifyListeners();
  }

  Widget buildPreview() {
    final preview =  _cameraController.buildPreview();
    _isCameraOpen = true;
    notifyListeners();
    return preview;

  }

  //Getters
  CameraController get cameraController => _cameraController;
  String get cameraErrorMsg => _cameraErrorMsg;
  bool get isCameraOpen => _isCameraOpen;

  @override
  void dispose() {
    _isCameraOpen = false;
    _cameraController.dispose();
    super.dispose();
  }
}
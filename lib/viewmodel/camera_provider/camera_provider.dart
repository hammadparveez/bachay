import 'package:bachay/config/camera_config.dart';
import 'package:bachay/constants/strings.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraProvider = ChangeNotifierProvider.autoDispose((ref) {
  final cameraNotifier = CameraNotifier();
  ref.onDispose(() => cameraNotifier._cameraController.dispose());
  return cameraNotifier;
});

class CameraNotifier extends ChangeNotifier {
  //Assign Camera Configuration
  final _cameraConfig = CameraConfig();
  bool _isCameraOpen = false;
  String _cameraErrorMsg;
  //Default Widget null Camera
  Widget _camera;

  //Accessing List of Camera description via GET_IT
  List<CameraDescription> get cameraDescriptions =>
      _cameraConfig.cameraDescription;
  CameraController _cameraController; //assigned on InitMethod

  //Initialize camera by receiving Camera Description(Front/Back)
  // Assign Resolution Min/Max/High
  initCamera(CameraDescription cameraDescription,
      ResolutionPreset resolutionPreset) async {
    try {
      //assigning configuration,
      //if fails throw error else cameraError = null
      _cameraController =
          await _cameraConfig.init(cameraDescription, resolutionPreset);
      _cameraErrorMsg = null;
    } catch (e) {
      //Default is CameraException
      _cameraErrorMsg = Strings.cameraCantOpen;
      //_camera = null;
    }
    notifyListeners();
  }

  //caches camera widget
  //if fails, handles error
  void buildPreview() {
    try {
      _camera = _cameraController.buildPreview();
      _isCameraOpen = true;
    } catch (e) {
      //if fails to build Preview then dispose
      // and show error
      _cameraController?.dispose();
      _cameraErrorMsg = Strings.failedToOpenCamera;
    }
    notifyListeners();
  }

  //Getters
  CameraController get cameraController => _cameraController;
  String get cameraErrorMsg => _cameraErrorMsg;
  bool get isCameraOpen => _isCameraOpen;
  Widget get camera => _camera;

  void cameraDispose() {
    //disposing Camera resources
    _camera = null;
    _isCameraOpen = false;
    _cameraErrorMsg = null;
    _cameraController.dispose();
    notifyListeners();
  }
}

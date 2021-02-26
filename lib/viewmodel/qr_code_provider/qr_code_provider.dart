import 'package:bachay/constants/strings.dart';
import 'package:bachay/view/home_view/components/camera_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

final qrCodeViewProvider = ChangeNotifierProvider((ref)=> QrCodeNotifier());
class QrCodeNotifier extends ChangeNotifier {
  QRViewController _qrViewController;
  bool isScannerOpen = true;
  Barcode _qrCode;
  String errorMessage;
  bool isCameraWidgetMounted = false;
  GlobalKey<CameraPreviewWidgetState> _key;

  GlobalKey<CameraPreviewWidgetState> get key => _key;

  QRViewController get qrViewController => _qrViewController;

  setKey(GlobalKey<CameraPreviewWidgetState> globalKey) {
    print("Global Key $globalKey");
    _key = globalKey;
    print("${key.currentState}");
    print("${key.currentState.mounted}");
    notifyListeners();
  }

  init(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController.scannedDataStream.listen((event) {
      _qrCode = event;
      isScannerOpen = false;
      _qrViewController.stopCamera();
      notifyListeners();

    });

  }
  void tryToOpenCamera() {
    isScannerOpen = true;
    notifyListeners();
  }
  void resumeCamera() async {
    try {
      await _qrViewController.resumeCamera();
      errorMessage = null;
    }catch(error) {
     // isScannerOpen = false;
      errorMessage = Strings.failedToOpenCamera;
    }
    notifyListeners();
  }
  void pauseCamera() async{
    await _qrViewController.pauseCamera();
    isScannerOpen = false;
    notifyListeners();
  }

}
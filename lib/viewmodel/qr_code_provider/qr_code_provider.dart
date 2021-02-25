import 'package:bachay/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

final qrCodeViewProvider = ChangeNotifierProvider((ref) => QrCodeNotifier());

class QrCodeNotifier extends ChangeNotifier {
  QRViewController _qrViewController;
  bool isScannerOpen = true;
  Barcode _qrCode;
  String errorMessage;
  bool _isCameraWidgetMounted = false;

  bool get isCameraWidgetMounted => _isCameraWidgetMounted;

  set isCameraWidgetMounted(bool value) {
    _isCameraWidgetMounted = value;
    notifyListeners();
  }

  QRViewController get qrViewController => _qrViewController;

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
      if (_isCameraWidgetMounted) {
        await _qrViewController.resumeCamera();
        errorMessage = null;
      }
    } catch (error) {
      // isScannerOpen = false;
      errorMessage = Strings.failedToOpenCamera;
    }
    notifyListeners();
  }

  void pauseCamera() async {
    await _qrViewController.pauseCamera();
    _qrViewController.dispose();
    isScannerOpen = false;
    _isCameraWidgetMounted = false;
    notifyListeners();
  }
}

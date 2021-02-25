import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

final qrCodeViewProvider = ChangeNotifierProvider((ref)=> QrCodeNotifier());
class QrCodeNotifier extends ChangeNotifier {
  QRViewController _qrViewController;
  bool isScannerOpen = true;
  QRViewController get qrViewController => _qrViewController;

  init(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController.scannedDataStream.listen((event) {
      print("${event.code}");
    });
  }
  void resumeCamera() async {
    await _qrViewController.resumeCamera();
    isScannerOpen = true;
    notifyListeners();
  }
  void stopCamera() async{

    await _qrViewController.stopCamera();
    _qrViewController.dispose();
    isScannerOpen = false;
    notifyListeners();
  }


}
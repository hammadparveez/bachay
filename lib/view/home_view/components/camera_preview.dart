
import 'dart:io';

import 'package:bachay/view/home_view/components/animated_qr_bar.dart';
import 'package:bachay/view/home_view/components/qr_scan_centered_text.dart';
import 'package:bachay/viewmodel/qr_code_provider/qr_code_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class CameraPreviewWidget extends StatefulWidget {
  const CameraPreviewWidget();
  @override
  CameraPreviewWidgetState createState() => CameraPreviewWidgetState();
}

class CameraPreviewWidgetState extends State<CameraPreviewWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");



  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    print("Mounded${mounted}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: context.responsive.widgetScaleFactor * 45,
      height: context.responsive.widgetScaleFactor * 45,
      child: Consumer(
        builder: (_, watch, child) {
          return Center(
            child: Stack(
              children: [
                QRView(key: qrKey, onQRViewCreated:
                 context.read(qrCodeViewProvider).init
                ),
                LayoutBuilder(
                  builder: (_, constraints) => Align(
                    child: Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(.1),
                        border: Border.all(),
                      ),
                      child: Stack(children: [
                        AnimatedQRScanBar(constraints: constraints),
                        const Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child:  QrScanCenteredText()),
                      ]),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}

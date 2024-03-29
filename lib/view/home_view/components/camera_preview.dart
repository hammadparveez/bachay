import 'package:bachay/responsive_ext.dart';
import 'package:bachay/view/home_view/components/animated_qr_bar.dart';
import 'package:bachay/view/home_view/components/qr_scan_centered_text.dart';
import 'package:bachay/viewmodel/qr_code_provider/qr_code_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraPreviewWidget extends StatefulWidget {
  final GlobalKey<CameraPreviewWidgetState> key;
  CameraPreviewWidget({this.key}) : super(key: key);
  @override
  CameraPreviewWidgetState createState() => CameraPreviewWidgetState();
}

class CameraPreviewWidgetState extends State<CameraPreviewWidget> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read(qrCodeViewProvider).isCameraWidgetMounted = mounted;
    });
  }




  @override
  void dispose() {



    super.dispose();
  }
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
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
                QRView(
                    key: qrKey,
                    onQRViewCreated: context.read(qrCodeViewProvider).init),
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
                            child:QrScanCenteredText()),
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

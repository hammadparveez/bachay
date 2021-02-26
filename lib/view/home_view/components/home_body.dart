
import 'dart:io';

import 'package:bachay/responsive_ext.dart';
import 'package:bachay/view/home_view/components/animated_qr_bar.dart';
import 'package:bachay/view/home_view/components/camera_preview.dart';
import 'package:bachay/view/home_view/components/curved_navigation_bar.dart';
import 'package:bachay/view/home_view/components/custom_appbar.dart';
import 'package:bachay/view/home_view/components/qr_code_hint.dart';
import 'package:bachay/view/home_view/components/qr_scan_centered_text.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:bachay/viewmodel/qr_code_provider/qr_code_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeBody extends StatefulWidget {
  final GlobalKey<CameraPreviewWidgetState> key1;
   HomeBody({this.key1});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Consumer(
              builder: (_, watch, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                   if (!watch(qrCodeViewProvider).isScannerOpen)
                       child
                    //display if camera is opened
                    else
                       CameraPreviewWidget(),

                   // BottomNavigation(),
                  ],
                );
              },
              child: const QRCodeHintWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

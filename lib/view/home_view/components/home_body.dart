
import 'dart:io';

import 'package:bachay/view/home_view/components/camera_preview.dart';
import 'package:bachay/view/home_view/components/custom_appbar.dart';
import 'package:bachay/view/home_view/components/qr_code_hint.dart';
import 'package:bachay/viewmodel/qr_code_provider/qr_code_provider.dart';
import 'package:bachay/viewmodel/riverpod_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverPod;


class HomeBody extends StatefulWidget {
  final GlobalKey<CameraPreviewWidgetState> key1;
   HomeBody({this.key1});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Permission.camera.isGranted.then((value) {
        if (!value)
          context.read(qrCodeViewProvider).closeCameraViewIfNotPermission();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

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
                       CameraPreviewWidget(key: widget.key1),

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

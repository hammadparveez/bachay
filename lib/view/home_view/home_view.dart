import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/view/home_view/components/camera_preview.dart';
import 'package:bachay/view/home_view/components/curved_navigation_bar.dart';
import 'package:bachay/view/home_view/components/home_body.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<CameraPreviewWidgetState> _cameraKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  HomeBody(key1: _cameraKey,
        ),
      ),
      bottomNavigationBar: ProviderListener(
        provider: cameraProvider,
        onChange: (_, CameraNotifier cameraNotifier) {
          //if (cameraNotifier.cameraErrorMsg != null)
        },
        child:  BottomNavigation(key1: _cameraKey),
      ),
    );
  }
}

import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/view/home_view/components/home_body.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const HomeBody(),
      ),
      bottomNavigationBar: ProviderListener(
        provider: cameraProvider,
        onChange: (_, CameraNotifier cameraNotifier) {
          //if (cameraNotifier.cameraErrorMsg != null)
        },
        child: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation();
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      backgroundColor: LightColors.TRANSPARENT,
      color: LightColors.PRIMARY_COLOR,
      onTap: (index) {
        switch (index) {
          case 0:
            _openCameraOnPress(context);
            break;
          case 1:
            _closeCameraOnPress(context);
            break;
        }
      },
      items: [
        Icon(CupertinoIcons.camera_viewfinder,
            size: context.responsive.widgetScaleFactor * 3.5),
        Icon(CupertinoIcons.clear,
            size: context.responsive.widgetScaleFactor * 3.5)
        // /IconButton(icon: Icon(Icons.close), onPressed: () {}),
      ],
    );
  }

  //Open Camera On Button Press
  void _openCameraOnPress(BuildContext context) async {
    final _cameraProvider = context.read(cameraProvider);
    context.read(themeProvider).updateTheme(ThemeStatus.LIGHT);
    if (!_cameraProvider.isCameraOpen) {
      await _cameraProvider.initCamera(
          _cameraProvider.cameraDescriptions.first, ResolutionPreset.ultraHigh);
      if (_cameraProvider.cameraErrorMsg == null)
        _cameraProvider.buildPreview();
    }
  }

  //Close Camera on button Press
  void _closeCameraOnPress(BuildContext context) {
    final _cameraProvider = context.read(cameraProvider);
    context.read(themeProvider).updateTheme(ThemeStatus.DARK);
    if (_cameraProvider.camera != null) _cameraProvider.cameraDispose();
  }
}

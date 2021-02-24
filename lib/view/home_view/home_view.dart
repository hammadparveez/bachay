import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/view/home_view/components/home_body.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bachay/constants/theme/theme_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CameraNotifier _cameraProvider;
  List<CameraDescription> _cameraDesc;
  @override
  void initState() {
    super.initState();
    _cameraProvider = context.read(cameraProvider);
    _cameraDesc = _cameraProvider.cameraDescriptions;
    _cameraProvider.initCamera(_cameraDesc.first, ResolutionPreset.max);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            RaisedButton(
              onPressed: () {
                context.read(themeProvider).updateTheme(ThemeStatus.DARK);
                //_cameraProvider.cameraController.dispose();
              },
              child: Text("Open Camera"),
            ),
            RaisedButton(
              onPressed: () async {
                context.read(themeProvider).updateTheme(ThemeStatus.LIGHT);
                //await _cameraProvider.initCamera(_cameraDesc.first, ResolutionPreset.ultraHigh);
                //_cameraProvider.buildPreview();
              },
              child: Text("Close Camera"),
            ),
          ],
        ),
      ),
      /*CurvedNavigationBar(
        height: 50,
        backgroundColor: LightColors.TRANSPARENT,
        color: LightColors.PRIMARY_COLOR,
        items: [
          IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {
            _cameraProvider.buildPreview();
          }),
          IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {
            _cameraProvider.cameraController.buildPreview();
          }),
          // /IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
      ),*/
    );
  }
  @override
  void dispose() {
    _cameraProvider.cameraController.dispose();
    super.dispose();
  }
}

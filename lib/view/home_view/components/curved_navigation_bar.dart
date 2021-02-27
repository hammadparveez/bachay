
import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/durations.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/constants/strings.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/routes/routes.dart';
import 'package:bachay/view/home_view/components/camera_preview.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:bachay/viewmodel/qr_code_provider/qr_code_provider.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bachay/constants/theme/theme_ext.dart';
import 'package:bachay/responsive_ext.dart';

class BottomNavigation extends StatefulWidget {
  final GlobalKey<CameraPreviewWidgetState> key1;
  BottomNavigation({this.key1});
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child) {
/*        if( !watch(qrCodeViewProvider).isCameraWidgetMounted )
        return RaisedButton(child: Text("Open",), onPressed: () async{
          final qrProvider = context.read(qrCodeViewProvider);
            final permisison = await Permission.camera.request();
            print("permission $permisison");
            if(PermissionStatus.granted == permisison ) {
              qrProvider.tryToOpenCamera();

              if(qrProvider.isCameraWidgetMounted)
                qrProvider.resumeCamera() ;

              if(qrProvider.errorMessage != null)
                showDialog(context: context, builder: (_) => PermissionDialog(dialogText: qrProvider.errorMessage ?? "", showAllow: false,));
            }else {
              qrProvider.closeCameraViewIfNotPermission();
              final status = await Permission.camera.isGranted;
              if(!status) {
                showDialog(context: context, builder: (_) => PermissionDialog(dialogText: Strings.PERMISSION_PARA,));
              }
            }
          }

         );
       else {
         return RaisedButton(child: Text("Close"), onPressed: () {
           context.read(qrCodeViewProvider).pauseCamera();
         },);
            }*/
        if(! watch(qrCodeViewProvider).isCameraWidgetMounted )
        return CurvedNavigationBar(
          key: UniqueKey(),
            height: 50,
            backgroundColor: LightColors.TRANSPARENT,
            color: LightColors.PRIMARY_COLOR,
            onTap: (index) async {
              final qrProvider = context.read(qrCodeViewProvider);
              if (index == 0) {
                final permisison = await Permission.camera.request();
                print("permission $permisison");
                if(PermissionStatus.granted == permisison ) {
                  qrProvider.tryToOpenCamera();
                  if(qrProvider.isCameraWidgetMounted)
                    qrProvider.resumeCamera() ;

                  if(qrProvider.errorMessage != null)
                    showDialog(context: context, builder: (_) => PermissionDialog(dialogText: qrProvider.errorMessage ?? "", showAllow: false,));
                }else {
                  qrProvider.closeCameraViewIfNotPermission();
                  final status = await Permission.camera.isGranted;
                  if(!status) {
                    showDialog(context: context, builder: (_) => PermissionDialog(dialogText: Strings.PERMISSION_PARA,));
                  }
                }
              }

            },
            items: [
              Icon(CupertinoIcons.camera_viewfinder,
                  size: context.responsive.widgetScaleFactor * 4),
            ],
          );
        else
          return CurvedNavigationBar(
      key: UniqueKey(),
            height: 50,
            backgroundColor: LightColors.TRANSPARENT,
            color: LightColors.PRIMARY_COLOR,
            onTap: (index) async {
              if (index == 0) context.read(qrCodeViewProvider).pauseCamera();
            },
            items: [
              Icon(CupertinoIcons.clear,
                  size: context.responsive.widgetScaleFactor * 3.5),
            ],
          );

      },
    );
  }

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

  void _closeCameraOnPress(BuildContext context) {
    final _cameraProvider = context.read(cameraProvider);
    context.read(themeProvider).updateTheme(ThemeStatus.DARK);
    if (_cameraProvider.camera != null) _cameraProvider.cameraDispose();
  }
}

class PermissionDialog extends StatelessWidget {
  final String dialogText;
  final bool showAllow;
  const PermissionDialog({Key key, this.dialogText,this.showAllow = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        actions: [
          FlatButton(onPressed: () =>
            Get.back(), child: Text(Strings.CLOSE,style: context.themeData.textTheme.bodyText2.copyWith(fontSize: context.responsive.textScaleFactor * 2)),),
          if(showAllow)
          ProviderListener(
            provider: qrCodeViewProvider,
            onChange: (_, QrCodeNotifier notifier) {
              if(notifier.errorMessage != null)
                showDialog(barrierDismissible: false, context: context, builder: (_) => PermissionDialog(dialogText: notifier.errorMessage,showAllow: false,));
            },
            child: FlatButton(onPressed: () async {
              final status = await Permission.camera.request();
              if(status.isPermanentlyDenied || status.isRestricted || status.isUndetermined) {
                Get.back();
                showDialog(barrierDismissible: false, context: context, builder: (_) => PermissionDialog(dialogText: Strings.PERMISSION_GUIDE_PARA,showAllow: false,));
              }
            }, child: Text(Strings.ALLOW,style: context.themeData.textTheme.bodyText2.copyWith(fontSize: context.responsive.textScaleFactor * 2) ),
            ),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(dialogText, style: context.themeData.textTheme.bodyText1.copyWith(fontSize: context.responsive.textScaleFactor * 2.1)),
          ],
        ),
      ),
    );
  }
}


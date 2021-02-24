import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/durations.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/constants/theme/theme_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:bachay/constants/styles/style.dart';

class HomeBody extends StatelessWidget {
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

                      child,
                    if (watch(cameraProvider).isCameraOpen)
                      Align(
                        child: SizedBox(
                          height: context.responsive.widgetScaleFactor * 30,
                          width: context.responsive.widgetScaleFactor * 40,
                          child: AspectRatio(
                              aspectRatio: watch(cameraProvider).cameraController.value.aspectRatio,
                              child: CameraPreview(
                                  watch(cameraProvider).cameraController)),
                        ),
                      ),
                  ],
                );
              },
              child: Padding(
                padding: Style.PADDING_HRT_8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.qr_code,
                      height: context.responsive.widgetScaleFactor * 10,
                      color: context.themeData.cardColor,
                    ),
                    const SizedBox(height: Values.VALUE_10),
                    Text(
                        "We are one of the leading\nmanufacturers of gypsum\nbased building materials",
                        style: context.themeData.textTheme.bodyText1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: Style.PADDING_ALL_4.copyWith(left: Values.VALUE_20),
      decoration: BoxDecoration(
        color: LightColors.PRIMARY_COLOR,
        borderRadius: Style.BORDER_BOTTOM_2SIDE_RADIUS,
      ),
      width: context.responsive.widgetScaleFactor * 100,
      height: context.responsive.widgetScaleFactor * 7.5,
      child: Image.asset(Images.logo, color: Colors.white),
    );
  }
}

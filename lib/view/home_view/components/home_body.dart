import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/theme/theme_ext.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/viewmodel/camera_provider/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends StatelessWidget {
  const HomeBody();
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
                    if (!watch(cameraProvider).isCameraOpen) child,
                    //display if camera is opened
                    if (watch(cameraProvider).isCameraOpen)
                      Align(
                        child: SizedBox(
                          height: 200,
                          width: 150,
                          child: watch(cameraProvider).camera,
                        ),
                      ),
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

class QRCodeHintWidget extends StatelessWidget {
  const QRCodeHintWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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

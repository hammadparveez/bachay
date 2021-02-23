import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/strings.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/theme/theme_ext.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/viewmodel/splash_riverpod/splash_riverpod.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double toRight = 0;
  int index = 0;
  @override
  void initState() {
    super.initState();
    final pageController = context.read(splashProvider).pageController;
    final length = context.read(splashProvider).length;
    context.read(splashProvider).pageController.addListener(() {
      final maxOffset = pageController.position.maxScrollExtent;
      final currentIndex = length - index;
      final totalPagesWidth = maxOffset / length;
      final offset = pageController.offset;
      print("---MAX---");
      print(maxOffset);
      print("---offset---");
      print(offset);
      print("---width---");
      print(context.responsive.deviceWidth / 1.5);
      print("Total Division");
      print(maxOffset / length);

      if (offset == (maxOffset / currentIndex))
        setState(() => toRight = 0);
      else
        setState(() => toRight += 1);
    });
  }

  onPageChange(int currentIndex) {
    setState(() => index = currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ScopedReader watch, child) => PageView.builder(
        onPageChanged: onPageChange,
        controller: watch(splashProvider).pageController,
        itemCount: watch(splashProvider).length,
        itemBuilder: (_, index) {
          return Stack(
            children: [
              Container(
                height: context.responsive.deviceHeight / 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                          child: Image.asset(
                        Images.logo,
                        height: context.responsive.widgetScaleFactor * 10,
                      )),
                    ),
                    Expanded(flex: 2, child: Image.asset(Images.board1)),
                  ],
                ),
              ),
              const SizedBox(height: Values.VALUE_10),
              AnimatedPositioned(
                duration: toRight > 0
                    ? const Duration(milliseconds: 1)
                    : const Duration(milliseconds: 500),
                bottom: Values.VALUE_25,
                right: toRight,
                child: Align(
                  child: Container(
                    height: context.responsive.widgetScaleFactor * 40,
                    width: context.responsive.deviceBlockWidth * 85,
                    decoration: BoxDecoration(
                      color: context.themeData.backgroundColor,
                      borderRadius: BorderRadius.circular(
                          context.responsive.widgetScaleFactor * 5),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: Style.BLUR_RADIUS3,
                            spreadRadius: Style.SPREAD_RADIUS3,
                            color: context.themeData.shadowColor)
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        _indicators(context),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(Strings.ON_BOARD_TITLE1,
                                style: context.themeData.textTheme.headline1
                                    .copyWith(
                                        fontSize:
                                            context.responsive.textScaleFactor *
                                                4)),
                            const SizedBox(height: Values.VALUE_10),
                            Text(Strings.ON_BOARD_PARA,
                                textAlign: TextAlign.center,
                                style: Style.secondaryTextStyleLight.copyWith(
                                    fontSize:
                                        context.responsive.widgetScaleFactor *
                                            1.8)),
                            const SizedBox(height: Values.VALUE_10),
                            //RaisedButton
                            RaisedButton(
                              onPressed: () {
                                context
                                    .read(themeProvider)
                                    .updateTheme(ThemeStatus.DARK);
                              },
                              color: LightColors.PRIMARY_COLOR,
                              shape: RoundedRectangleBorder(
                                  borderRadius: Style.BORDER_FULL_RADIUS),
                              child: Text(Strings.NEXT,
                                  style: Style.secondaryTextStyleLightWhite
                                      .copyWith(
                                          fontSize: context.responsive
                                                  .widgetScaleFactor *
                                              1.8)),
                            ),
                            //FlatButton
                            FlatButton(
                              onPressed: () {
                                context
                                    .read(themeProvider)
                                    .updateTheme(ThemeStatus.LIGHT);
                              },
                              child: Text(
                                Strings.SKIP,
                                style: context.themeData.textTheme.bodyText1
                                    .copyWith(
                                        fontSize: context
                                                .responsive.widgetScaleFactor *
                                            1.5),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _indicators(BuildContext context) {
    return Padding(
      padding: Style.PADDING_VRT_25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.responsive.widgetScaleFactor * 1.5,
            width: context.responsive.widgetScaleFactor * 1.5,
            decoration: BoxDecoration(
              borderRadius: Style.BORDER_FULL_RADIUS,
              color: LightColors.PRIMARY_COLOR,
            ),
          ),
          const SizedBox(width: Values.VALUE_8),
          Container(
            height: context.responsive.widgetScaleFactor * 1.5,
            width: context.responsive.widgetScaleFactor * 5,
            decoration: BoxDecoration(
              borderRadius: Style.BORDER_FULL_RADIUS,
              color: LightColors.PRIMARY_COLOR,
            ),
          ),
          const SizedBox(width: Values.VALUE_8),
          Container(
            height: context.responsive.widgetScaleFactor * 1.5,
            width: context.responsive.widgetScaleFactor * 1.5,
            decoration: BoxDecoration(
              borderRadius: Style.BORDER_FULL_RADIUS,
              color: LightColors.PRIMARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}

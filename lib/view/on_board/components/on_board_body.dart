import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/durations.dart';
import 'package:bachay/constants/enums/theme_status.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/strings.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/theme/theme_ext.dart';
import 'package:bachay/constants/values.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/routes/routes.dart';
import 'package:bachay/viewmodel/on_board_provider/on_board_provider.dart';
import 'package:bachay/viewmodel/splash_riverpod/splash_riverpod.dart';
import 'package:bachay/viewmodel/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class OnBoardBody extends StatefulWidget {
  @override
  _OnBoardBodyState createState() => _OnBoardBodyState();
}

class _OnBoardBodyState extends State<OnBoardBody> {
  double toRight = 0;
  int index = 0, totalPages;
  Widget _indicatorContainer;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    initIndicatorCont();
    _pageController = context.read(splashProvider).pageController;
    totalPages = context.read(splashProvider).length;
    context.read(splashProvider).pageController.addListener(() {
      final maxOffset = _pageController.position.maxScrollExtent;
      final currentIndex = totalPages - index;
      final offset = _pageController.offset;
      if(offset == (maxOffset/currentIndex) || offset == _pageController.initialScrollOffset) {
        setState(() => toRight = 0);
      }
      else if (_pageController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() => toRight += 1);
      } else if(_pageController.position.userScrollDirection == ScrollDirection.forward){
        setState(() => toRight -= 1);
      }
    });
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();

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
              _animatedPositionedContainer(),
            ],
          );
        },
      ),
    );
  }

  //Animated Positioned Container
  Widget _animatedPositionedContainer() {
    return AnimatedPositioned(
      duration: toRight  == 0 ?
      Durations.ONE_500_MILLI: Durations.MICRO_500,
      curve: toRight  == 0 ? Curves.easeInExpo : Curves.easeInCubic,
      bottom: Values.VALUE_25,
      right: toRight == 0 ? 0 : toRight + context.responsive.widgetScaleFactor * 7,
      left: 0,
      child:
      Align(
        child:Container(
          height: context.responsive.widgetScaleFactor * 40,
          width: context.responsive.widgetScaleFactor * 42,
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
                          _pageController.animateToPage(index+1, duration: Durations.ONE_500_MILLI, curve: Curves.easeInExpo);
                          if(index == totalPages-1) {
                            context.read(onBoardProvider).setOnBoardSeen(true);
                            Get.offAllNamed(Routes.HOME);
                          }
                          else
                          _pageController.animateToPage(index+1, duration: Durations.ONE_500_MILLI, curve: Curves.easeInExpo);
  },
                        color: LightColors.PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: Style.BORDER_FULL_RADIUS),
                        child: Text(index != totalPages-1 ? Strings.NEXT: Strings.GET_STARTED,
                            style: Style.secondaryTextStyleLightWhite
                                .copyWith(
                                fontSize: context.responsive
                                    .widgetScaleFactor *
                                    1.8)),
                      ),
                      //FlatButton
                      if(index != totalPages-1)
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
        ) ,
      ),
    );
  }

  //On page change Indicators
  Widget _indicators(BuildContext context) {
    return Padding(
      padding: Style.PADDING_VRT_25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(totalPages, (index) => initIndicatorCont(index),).toList(),
      ),
    );
  }

  //Initialize Indicator Container
  Widget initIndicatorCont([int currentIndex]) {
    return Row(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Durations.ONE_800_MILLI,
          height: context.responsive.widgetScaleFactor * 1.5,
          width: currentIndex == index ?  context.responsive.widgetScaleFactor * 5 : context.responsive.widgetScaleFactor * 1.5,
          child: LayoutBuilder(
              builder: (context, constraints) {
                return Consumer(
                  builder: (_, watch, child) {
                    return Row(
                      children: [
                        Container(decoration:  BoxDecoration(
                          borderRadius: Style.BORDER_LEFT_FULL_RADIUS,
                          color: watch(themeProvider).themeStatus == ThemeStatus.LIGHT ? context.themeData.primaryColor : context.themeData.shadowColor,
                        ),
                          width: constraints.maxWidth/2,

                        ),
                        Container(decoration:  BoxDecoration(
                          borderRadius: Style.BORDER_RIGHT_FULL_RADIUS,
                          color: watch(themeProvider).themeStatus == ThemeStatus.DARK ? context.themeData.splashColor : context.themeData.shadowColor,

                        ),
                          width: constraints.maxWidth/2,

                        ),
                      ],
                    );
                  },
                );
              }
          ),
        ),
        const SizedBox(width: Values.VALUE_8),
      ],
    );
  }
}

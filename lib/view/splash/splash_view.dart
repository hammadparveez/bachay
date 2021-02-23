import 'package:bachay/constants/durations.dart';
import 'package:bachay/routes/routes.dart';
import 'package:bachay/view/splash/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _redirectTo());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SplashBody(),
      ),
    );
  }

  void _redirectTo() async {
    Future.delayed(Durations.ONE_TWO_SEC, () {
      Get.offAndToNamed(Routes.HOME);
    });
  }
}

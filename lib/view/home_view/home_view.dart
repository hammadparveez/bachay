import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static double positionValue = Get.width / 2;
  static final _tween = Tween(begin: 0.0, end: positionValue);

  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Text("Hello World"),
            TweenAnimationBuilder(
              duration: Duration(seconds: 2),
              tween: _tween,
              onEnd: () {
                setState(() {
                  positionValue =
                      positionValue == Get.width / 2 ? 0 : Get.width / 2;
                });
              },
              builder: (_, num value, child) {
                return Positioned(
                  right: value,
                  child: RaisedButton(
                    child: Text("Click Me"),
                    onPressed: () {
                      positionValue =
                          positionValue == Get.width / 2 ? 0 : Get.width / 2;
                      //isChanged = !isChanged;
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

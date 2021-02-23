import 'dart:math' as math;

import 'package:bachay/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:get/get.dart';

class SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Align(
            child: SizedBox(
              width: context.responsive.widgetScaleFactor * 23,
              child: Image.asset(Images.logo),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
            left: 0,
            right: 0,
            child: Align(
          child: Image.asset(Images.splash_bg, width: context.responsive.widgetScaleFactor * 100,),
        )),

      ],
    );
  }
}

class CustomArcLoader extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //path.lineTo(0.0, size.height-100);
    path.addArc(Rect.fromCircle(center: Offset(size.width/2, size.width), radius: 80), 0, 180);
    path.close();
    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
  return false;
  }

}

class ArcPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width*50, size.width* 50));
    final startAngle = math.pi ;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
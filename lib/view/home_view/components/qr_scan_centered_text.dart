
import 'package:bachay/constants/app_constants.dart';
import 'package:bachay/constants/color_resources.dart';
import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/strings.dart';
import 'package:flutter/material.dart';
class QrScanCenteredText extends StatelessWidget {
  const QrScanCenteredText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Align(
        alignment: Alignment.center,
        child: Image.asset("assets/images/knauf_trans.png", color:  LightColors.PRIMARY_COLOR.withOpacity(.2), height: constraints.maxHeight / .8,),
        /*Text(
          Strings.APP_NAME,
          style: TextStyle(
              fontSize: constraints.maxWidth/3,
              fontWeight: FontWeight.bold,
              fontFamily: AppConstants.VOLTE,
              color: Colors.black38),
        ),*/
      ),
    );
  }
}
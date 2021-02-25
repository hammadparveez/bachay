import 'package:bachay/constants/images.dart';
import 'package:bachay/constants/strings.dart';
import 'package:bachay/constants/styles/style.dart';
import 'package:bachay/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:bachay/responsive_ext.dart';
import 'package:bachay/constants/theme/theme_ext.dart';

//Qr Code Hint Text Widget
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
              Strings.QR_CODE_PARA,
              style: context.themeData.textTheme.bodyText1),
        ],
      ),
    );
  }
}

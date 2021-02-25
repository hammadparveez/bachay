
import 'package:bachay/constants/app_constants.dart';
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
        child: Text(
          Strings.APP_NAME,
          style: TextStyle(
              fontSize: constraints.maxHeight / 2.2,
              fontWeight: FontWeight.bold,
              fontFamily: AppConstants.VOLTE,
              color: Colors.black38),
        ),
      ),
    );
  }
}
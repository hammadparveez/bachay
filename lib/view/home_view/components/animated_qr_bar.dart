

import 'package:bachay/constants/durations.dart';
import 'package:flutter/material.dart';

class AnimatedQRScanBar extends StatefulWidget {
  const AnimatedQRScanBar({Key key, this.constraints});
  final BoxConstraints constraints;
  @override
  _AnimatedQRScanBarState createState() => _AnimatedQRScanBarState();
}

class _AnimatedQRScanBarState extends State<AnimatedQRScanBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        value: 0,
        lowerBound: -1,
        upperBound: 1,
        vsync: this,
        duration: Durations.ONE_HALF_SEC);
    _animationController.repeat(
      min: -1,
      max: 1,
      reverse: true,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      listenable: _animationController,
      value: Alignment.topCenter,
      builder: (_) {
        return Align(
          alignment: Alignment(
              0,
              _animationController
                  .value), //_alignment ? value: Alignment.topCenter,
          child: Container(
            width: widget.constraints.maxWidth,
            height: 1.5,
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          ),
        );
      },
    );
  }
}

class AnimatedAlign extends AnimatedWidget {
  const AnimatedAlign({Key key, this.listenable, this.value, this.builder})
      : super(listenable: listenable);
  final Listenable listenable;
  final Alignment value;
  final Widget Function(BuildContext) builder;

  Animation<Alignment> get getHeight => listenable;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

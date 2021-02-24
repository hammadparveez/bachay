import 'package:bachay/view/on_board/components/on_board_body.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBoardBody()),
    );
  }
}

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Widget build(context) {
    return Container(
      child: Image(
        image: AssetImage('assets/aydle-logo.png'),
      ),
      margin: EdgeInsets.only(bottom: 24.0),
    );
  }
}

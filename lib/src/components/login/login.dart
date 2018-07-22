import 'package:flutter/material.dart';
import 'login_email.dart';
import '../../widgets/background.dart';

class Login extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      body: ParallaxBackground(
        child: EmailLogin(),
        // blurFactor: 2.0,
      ),
    );
  }
}

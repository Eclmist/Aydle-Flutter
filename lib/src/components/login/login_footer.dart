import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: 'Don\'t have an account? '),
        TextSpan(
          text: 'Sign Up',
          style: TextStyle(color: Colors.blue),
        ),
      ]),
      textAlign: TextAlign.center,
    );
  }
}

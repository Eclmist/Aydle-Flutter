import 'package:Aydle/src/components/login/social.dart';
import 'package:flutter/material.dart';
import 'login_button.dart';
import '../../widgets/logo.dart';
import 'login_footer.dart';

class EmailLogin extends StatelessWidget {
  Widget build(context) {
    return Column(
      children: <Widget>[
        Flexible(child: Logo()),
        Container(
          child: Column(
            children: <Widget>[
              emailField(),
              Container(margin: EdgeInsets.only(top: 12.0)),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 24.0)),
              LoginButton(),
            ],
          ),
          padding: EdgeInsets.only(
            left: 42.0,
            right: 42.0,
            bottom: 24.0,
          ),
        ),
        Flexible(
          child: LoginFooter(),
        ),
      ],
      // padding: EdgeInsets.all(24.0),
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            32.0,
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: 32.0,
          left: 16.0,
          right: 16.0,
        ),
        prefixIcon: Padding(
          child: Icon(Icons.person),
          padding: EdgeInsets.only(right: 12.0),
        ),
        filled: true,
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            32.0,
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: 32.0,
          left: 16.0,
          right: 16.0,
        ),
        prefixIcon: Padding(
          child: Icon(Icons.lock),
          padding: EdgeInsets.only(right: 12.0),
        ),
        filled: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Social extends StatefulWidget {
  @override
  SocialState createState() {
    // TODO: implement createState
    return SocialState();
  }
}

class SocialState extends State<Social> {
  Widget build(context) {
    return Row(
      children: <Widget>[
        facebookButton(),
        facebookButton(),
      ],
    );
  }

  Widget facebookButton() {
    return Material(
      child: MaterialButton(
        child: Icon(Icons.hotel),
      ),
    );
  }
}

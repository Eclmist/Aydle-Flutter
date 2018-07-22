import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  @override
  AnimatedButtonState createState() {
    // TODO: implement createState
    return AnimatedButtonState();
  }
}

class AnimatedButtonState extends State<LoginButton>
    with TickerProviderStateMixin {
  AnimationController _squeezeController;
  Animation _buttonSqueezeAnimation;

  void initState() {
    super.initState();

    _squeezeController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _buttonSqueezeAnimation = Tween(
      begin: 320.0,
      end: 70.0,
    ).animate(
      CurvedAnimation(
        parent: _squeezeController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Widget build(context) {
    return AnimatedBuilder(
      animation: _buttonSqueezeAnimation,
      builder: (context, child) {
        return Container(
          width: _buttonSqueezeAnimation.value,
          child: Material(
            child: MaterialButton(
              child: _buttonSqueezeAnimation.value > 75
                  ? Text('Login')
                  : Container(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.0,
                      ),
                      height: 20.0,
                      width: 20.0,
                    ),
              height: 50.0,
              onPressed: Login,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
        );
      },
    );
  }

  void Login() {
    // success
    _playShrinkAnimation();
  }

  void _playShrinkAnimation() async {
    try {
      await _squeezeController.forward();
      Navigator.of(context).pushReplacementNamed('/home');
      // await _squeezeController.reverse();
    } on TickerCanceled {}
  }
}

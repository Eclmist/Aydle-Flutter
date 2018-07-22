import 'package:flutter/material.dart';
import 'src/components/login/login.dart';
import 'src/components/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  var _routes = <String, WidgetBuilder>{
    '/home': (context) => Home(),
    '/login': (context) => Login(),
  };

  build(context) {
    return MaterialApp(
      title: 'Aydle',
      theme: ThemeData.dark(),
      home: Login(),
      routes: _routes,
    );
  }
}

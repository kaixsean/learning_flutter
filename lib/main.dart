import 'package:flutter/material.dart';
import 'app_body.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = const Text('Flutter App');
    var appBody = AppBody();

    var appBar = AppBar(title: appTitle);

    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
      ),
    );

    return app;
  }
}

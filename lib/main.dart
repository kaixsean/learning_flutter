import 'package:flutter/material.dart';
import 'package:flutter_app/second_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('切換頁面'));

    final btn = ElevatedButton(
        onPressed: () => Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) =>
                    SecondPage(),
                transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) =>
                    ScaleTransition(
                      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation, curve: Curves.fastOutSlowIn)),
                      child: RotationTransition(
                        turns: Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).animate(
                          CurvedAnimation(
                              parent: animation, curve: Curves.linear),
                        ),
                        child: child,
                      ),
                    ))),
        child: const Text('開啟第二頁'));

    final widget = Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(30),
      child: btn,
    );

    final appHomePage = Scaffold(appBar: appBar, body: widget);

    return appHomePage;
  }
}

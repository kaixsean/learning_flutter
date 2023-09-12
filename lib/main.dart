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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second page': (context) => SecondPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('切換頁面'));

    final btn = ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/second page'),
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

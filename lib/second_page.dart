import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('第二頁'),
      backgroundColor: Colors.amber,
    );

    final btn = ElevatedButton(
        onPressed: () => Navigator.pop(context), child: const Text('回到上一頁'));

    final widget = Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(30),
      child: btn,
    );

    final page = Scaffold(
      appBar: appBar,
      body: widget,
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
    );

    return page;
  }
}

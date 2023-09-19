import 'package:flutter/material.dart';

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
    final appBar = AppBar(title: const Text('對話盒範例'));

    var btn = ElevatedButton(
        onPressed: () => _showDialog(context),
        child: const Text(
          '顯示對話盒',
          style: TextStyle(fontSize: 20),
        ));

    final widget = Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(20),
      child: btn,
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }

  _showDialog(BuildContext context) {
    var dlg = AlertDialog(
      title: const Text('對話和標題'),
      content: const Text('對話盒文字'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("OK"))
      ],
    );

    showDialog(context: context, builder: (context) => dlg);
  }
}

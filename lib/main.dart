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
  final ValueNotifier<int?> _dlgResult = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('對話盒範例'));

    var btn = ElevatedButton(
        onPressed: () async {
          var ans = await _showDialog(context);
          _dlgResult.value = ans;
        },
        child: const Text(
          '顯示對話盒',
          style: TextStyle(fontSize: 20),
        ));

    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: btn,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder<int?>(
              builder: _showDlgResult,
              valueListenable: _dlgResult,
            ),
          )
        ],
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }

  _showDialog(BuildContext context) async {
    var dlg = AlertDialog(
      content: const Text('程式結束前是否要儲存檔案'),
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      contentTextStyle: const TextStyle(color: Colors.indigo, fontSize: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 1), child: const Text("是")),
        TextButton(
            onPressed: () => Navigator.pop(context, 0), child: const Text("否")),
        TextButton(
            onPressed: () => Navigator.pop(context, -1),
            child: const Text("取消"))
      ],
    );

    var ans = showDialog(context: context, builder: (context) => dlg);

    return ans;
  }

  Widget _showDlgResult(BuildContext context, int? result, Widget? child) {
    final widget = Text(
      result == null ? '' : result.toString(),
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }
}

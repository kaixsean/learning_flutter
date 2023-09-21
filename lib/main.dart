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
  static const _cities = ['倫敦', '東京', '舊金山'];

  final ValueNotifier<String> _dlgResult = ValueNotifier('');
  final ValueNotifier<int?> _selectedCity = ValueNotifier(null);

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
            child: ValueListenableBuilder<String>(
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
    var dlg = SimpleDialog(
      title: const Text('程式結束前是否要儲存檔案'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      children: <Widget>[
        SimpleDialogOption(
          child: const Text('是', style: TextStyle(fontSize: 20),),
          onPressed: () => Navigator.pop(context, 1),
        ),
        SimpleDialogOption(
          child: const Text('否', style: TextStyle(fontSize: 20),),
          onPressed: () => Navigator.pop(context, 0),
        ),
        SimpleDialogOption(
          child: const Text('取消', style: TextStyle(fontSize: 20),),
          onPressed: () => Navigator.pop(context, -1),
        )
      ],
    );

    var ans = showDialog(context: context, builder: (context) => dlg);

    return ans;
  }

  Widget _showDlgResult(BuildContext context, String? result, Widget? child) {
    final widget = Text(
      result == null ? '' : result.toString(),
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }

  Widget _cityOptionsBuilder(
      BuildContext context, int? selectedItem, Widget? child) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < _cities.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: selectedItem,
          title: Text(
            _cities[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) => _selectedCity.value = value));
    }

    final wid = Column(
      mainAxisSize: MainAxisSize.min,
      children: radioItems,
    );

    return wid;
  }
}

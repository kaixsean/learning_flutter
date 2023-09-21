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
    final btnOk = ElevatedButton(
        onPressed: () => Navigator.pop(context, ''),
        child: const Text(
          '取消',
          style: TextStyle(fontSize: 20),
        ));
    final btnCancel = ElevatedButton(
        onPressed: () => Navigator.pop(context,
            _selectedCity.value == null ? '' : _cities[_selectedCity.value!]),
        child: const Text(
          '確定',
          style: TextStyle(fontSize: 20),
        ));
    final btns = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
              child: btnCancel,
            )),
        Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
              child: btnOk,
            ))
      ],
    );

    var dlg = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ValueListenableBuilder<int?>(
              valueListenable: _selectedCity, builder: _cityOptionsBuilder),
          btns,
        ],
      ),
    );

    var willPopScope = WillPopScope(child: dlg, onWillPop: () async => false);

    var ans = showDialog(context: context, builder: (context) => willPopScope);

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

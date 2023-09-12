import 'package:flutter/material.dart';
import 'data.dart';

class SelectDrink extends StatelessWidget {
  final _drink = ['紅茶', '泡沫綠茶'];
  final ValueNotifier<int?> _selectedItem = ValueNotifier(Data.drinkItem);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('選擇飲料'),
    );

    final btn = ElevatedButton(
        onPressed: () => _backToHomePage(context), child: const Text('確定'));

    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder<int?>(
              builder: _drinkOptionBuilder,
              valueListenable: _selectedItem,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: btn,
          )
        ],
      ),
    );

    final page = Scaffold(
      appBar: appBar,
      body: widget,
    );

    var willPopScope = WillPopScope(
      onWillPop: () => _backToHomePage(context),
      child: page,
    );

    return willPopScope;
  }

  Widget _drinkOptionBuilder(
      BuildContext context, int? selectedItem, Widget? child) {
    var radioItem = <RadioListTile>[];

    for (var i = 0; i < _drink.length; i++) {
      radioItem.add(RadioListTile(
          value: i,
          groupValue: selectedItem,
          title: Text(
            _drink[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) => _selectedItem.value = value));
    }

    final wid = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItem,
    );

    return wid;
  }

  _backToHomePage(BuildContext context) {
    Data.drinkItem = _selectedItem.value;
    String? drink = Data.drinkItem != null ? _drink[Data.drinkItem!] : null;
    Navigator.pop(context, drink);
  }
}

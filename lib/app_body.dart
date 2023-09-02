import 'package:flutter/material.dart';

var trans = ['火車', '高鐵', '巴士'];

class AppBody extends StatelessWidget {
  final ValueNotifier<String> _itemName = ValueNotifier('');
  final ValueNotifier<int> _selectedItem = ValueNotifier(-1);

  AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
        onPressed: () {
          _itemName.value =
              _selectedItem.value < 0 ? '' : trans[_selectedItem.value];
        },
        child: const Text('確定'));

    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder<int>(
              builder: _dropdownButtonBuilder,
              valueListenable: _selectedItem,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: btn,
          ),
          Container(
            child: ValueListenableBuilder<String>(
              builder: _itemNameWidgetBuilder,
              valueListenable: _itemName,
            ),
          )
        ],
      ),
    );
    return widget;
  }

  Widget _itemNameWidgetBuilder(
      BuildContext context, String itemName, Widget? child) {
    final widget = Text(
      itemName,
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }

  Widget _dropdownButtonBuilder(
      BuildContext context, int selectItem, Widget? child) {
    final btn = DropdownButton(
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          value: 0,
          child: Text(
            trans[0],
            style: const TextStyle(fontSize: 20),
          ),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text(
            trans[1],
            style: const TextStyle(fontSize: 20),
          ),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text(
            trans[2],
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
      onChanged: (dynamic value) => _selectedItem.value = value as int,
      hint: const Text(
        '請選擇交通工具',
        style: TextStyle(fontSize: 20),
      ),
      value: selectItem < 0 ? null : selectItem,
    );

    return btn;
  }
}

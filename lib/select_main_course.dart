import 'package:flutter/material.dart';
import 'data.dart';

class SelectMainCourse extends StatelessWidget {
  final _mainCourses = ['牛肉麵', '排骨飯', '魚排飯'];
  final ValueNotifier<int?> _selectedItem = ValueNotifier(Data.mainCourseItem);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('選擇主餐'),
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
              builder: _mainCourseOptionBuilder,
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

    var willPopScope =
        WillPopScope(child: page, onWillPop: () => _backToHomePage(context));
    return willPopScope;
  }

  Widget _mainCourseOptionBuilder(
      BuildContext context, int? selectedItem, Widget? child) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < _mainCourses.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: selectedItem,
          title: Text(
            _mainCourses[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) => _selectedItem.value = value));
    }

    final wid = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return wid;
  }

  _backToHomePage(BuildContext context) {
    Data.mainCourseItem = _selectedItem.value;
    String? mainCourse =
        Data.mainCourseItem != null ? _mainCourses[Data.mainCourseItem!] : null;
    Navigator.pop(context, mainCourse);
  }
}

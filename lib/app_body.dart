import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AppBody extends StatelessWidget {
  static const _male = '男生', _female = '女生';
  final ValueNotifier<String> _gender = ValueNotifier('');
  final ValueNotifier<int> _selectedGender = ValueNotifier(0);

  final ValueNotifier<int> _age = ValueNotifier(20);
  static const int _maxAge = 100, _minAge = 0;

  final ValueNotifier<String> _text = ValueNotifier('');

  AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final nameField = TextField(
      controller: nameController,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
          labelText: '輸入姓名', labelStyle: TextStyle(fontSize: 20)),
    );

    final btn = ElevatedButton(
        onPressed: () => _showSuggestion(), child: const Text('確定'));

    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            alignment: Alignment.centerLeft,
            child: const Text(
              '性別:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: ValueListenableBuilder<int>(
              builder: _radioButtonBuilder,
              valueListenable: _selectedGender,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder<int>(
              builder: _agePickerBuilder,
              valueListenable: _age,
            ),
          ),
          Container(
            child: btn,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder<String>(
              builder: _textWidgetBuilder,
              valueListenable: _text,
            ),
          )
        ],
      ),
    );

    return widget;
  }

  Widget _radioButtonBuilder(
      BuildContext context, int selectedItem, Widget? child) {
    var genders = const <String>[_male, _female];

    var radioItems = <RadioListTile>[];

    for (var i = 0; i < genders.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: _selectedGender.value,
          title: Text(
            genders[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) => _selectedGender.value = value));
    }

    final wid = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return wid;
  }

  Widget _agePickerBuilder(
      BuildContext context, int selectedAge, Widget? child) {
    final wid = NumberPicker(
        minValue: _minAge,
        maxValue: _maxAge,
        value: selectedAge,
        onChanged: (newValue) => _age.value = newValue);
    return wid;
  }

  Widget _textWidgetBuilder(BuildContext context, String text, Widget? child) {
    final wid = Text(
      text,
      style: const TextStyle(fontSize: 20),
    );

    return wid;
  }

  _showSuggestion() {
    if (_gender.value == _male) {
      if (_age.value <= 27) {
        _text.value = '不急';
      } else if (_age.value > 27 && _age.value <= 32) {
        _text.value = '開始找對象';
      } else {
        _text.value = '趕快結婚';
      }
    } else {
      if (_age.value <= 25) {
        _text.value = '不急';
      } else if (_age.value > 25 && _age.value <= 30) {
        _text.value = '開始找對象';
      } else {
        _text.value = '趕快結婚';
      }
    }
  }
}

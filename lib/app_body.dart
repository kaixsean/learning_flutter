import 'package:flutter/material.dart';

var citites = ['倫敦', '東京', '舊金山'];

class AppBody extends StatelessWidget {
  final ValueNotifier<String> _cityName = ValueNotifier('');
  final ValueNotifier<int> _selectedCity = ValueNotifier(0);

  AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
        onPressed: () {
          _cityName.value =
              _selectedCity.value < 0 ? '' : citites[_selectedCity.value];
        },
        child: const Text('確定'));

    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ValueListenableBuilder<int>(
              builder: _radioButtonBuilder,
              valueListenable: _selectedCity,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: btn,
          ),
          Container(
            child: ValueListenableBuilder<String>(
              builder: _cityNameWidgetBuilder,
              valueListenable: _cityName,
            ),
          )
        ],
      ),
    );
    return widget;
  }

  Widget _cityNameWidgetBuilder(
      BuildContext context, String cityName, Widget? child) {
    final widget = Text(
      cityName,
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }

  Widget _radioButtonBuilder(
      BuildContext context, int selectedItem, Widget? child) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < citites.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: _selectedCity.value,
          title: Text(
            citites[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) => _selectedCity.value = value));
    }

    final wid = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return wid;
  }
}

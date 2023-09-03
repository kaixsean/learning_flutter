import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AppBody extends StatelessWidget {
  final ValueNotifier<int> _age = ValueNotifier(20);
  static const int _maxAge = 100, _minAge = 0;

  AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = ValueListenableBuilder<int>(
        valueListenable: _age, builder: _agePickerBuilder);
    return widget;
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
}

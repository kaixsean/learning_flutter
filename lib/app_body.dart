import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  final ValueNotifier<String> _inputName = ValueNotifier('');

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
        onPressed: () => _inputName.value = nameController.text,
        child: const Text('確定'));

    final widget = Center(
      heightFactor: 2,
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: nameField,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: btn,
          ),
          Container(
            child: ValueListenableBuilder<String>(
              builder: _inputNameWidgetBuilder,
              valueListenable: _inputName,
            ),
          ),
        ],
      ),
    );
    return widget;
  }
}

Widget _inputNameWidgetBuilder(
    BuildContext context, String inputName, Widget? child) {
  final widget = Text(inputName, style: const TextStyle(fontSize: 20));
  return widget;
}

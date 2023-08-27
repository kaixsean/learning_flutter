import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

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
        onPressed: () => _showSnackBar(context, nameController.text),
        child: const Text('確定'));

    final widget = Center(
      heightFactor: 2,
      child: Column(
        children: <Widget>[
          Container(
            child: nameField,
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(child: btn, margin: const EdgeInsets.symmetric(vertical: 10),)
        ],
      ),
    );
    return widget;
  }

  void _showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

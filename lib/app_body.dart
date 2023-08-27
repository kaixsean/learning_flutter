import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn1 = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 8,
      ),
      onPressed: () => _showSnackBar(context, '你按下按鈕'),
      child: const Text(
        '顯示 SnackBar 訊息',
        style: TextStyle(fontSize: 20, color: Colors.redAccent),
      ),
    );

    final btn2 = TextButton(
        onPressed: () => _showSnackBar(context, '你按下按鈕'),
        child: const Text(
          'TextButton',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ));

    final btn3 = OutlinedButton(
        onPressed: () => _showSnackBar(context, '你按下按鈕'),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            side: const BorderSide(
              color: Colors.red,
              style: BorderStyle.solid,
              width: 0.8,
            )),
        child: const Text(
          'OutlineButton',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ));

    final btn4 = IconButton(
      onPressed: () => _showSnackBar(context, '你按下按鈕'),
      icon: const Icon(Icons.phone_android),
      iconSize: 40,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    );

    final btn5 = FloatingActionButton(
      onPressed: () => _showSnackBar(context, '你按下按鈕'),
      elevation: 8,
      shape: const CircleBorder(),
      child: const Icon(Icons.phone_android),
    );

    final btn6 = ElevatedButton.icon(
      onPressed: () => _showSnackBar(context, '你按下按鈕'),
      label: const Text('ElevatedButton.icon',
          style: TextStyle(fontSize: 20, color: Colors.black12)),
      icon: const Icon(Icons.phone_android, color: Colors.redAccent),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 0),
    );

    final widget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10), child: btn1),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10), child: btn2),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10), child: btn3),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10), child: btn4),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10), child: btn5),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10), child: btn6),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      action: SnackBarAction(
        label: 'Toast 訊息',
        textColor: Colors.white,
        onPressed: () => Fluttertoast.showToast(
            msg: '你按下 SnackBar',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 20.0),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

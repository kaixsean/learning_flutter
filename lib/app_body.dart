import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = PopupMenuButton(
      itemBuilder: (context) {
        return const <PopupMenuEntry>[
          PopupMenuItem(
            value: 1,
            child: Text(
              "第一項",
              style: TextStyle(fontSize: 20),
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            value: 2,
            child: Text(
              "第二項",
              style: TextStyle(fontSize: 20),
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            value: 3,
            child: Text(
              "第三項",
              style: TextStyle(fontSize: 20),
            ),
          )
        ];
      },
      color: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      offset: const Offset(100, 30),
      onSelected: (value) => _showSnackBar(context, value.toString()),
      onCanceled: () => _showSnackBar(context, "取消選擇"),
    );

    final widget = Center(
      heightFactor: 2,
      child: btn,
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

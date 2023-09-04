import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ValueNotifier<String> _selectedItem = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('ListView 範例'));

    const items = <String>['第一項', '第二項', '第三項'];

    var listView = ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(fontSize: 20),
                ),
                onTap: () => _selectedItem.value = '點選' + items[index],
              ),
            ),
        separatorBuilder: (context, index) => const Divider());

    final widget = Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          ValueListenableBuilder<String>(
              valueListenable: _selectedItem, builder: _selectedItemBuilder),
          Expanded(child: listView)
        ],
      ),
    );

    final appHomePage = Scaffold(appBar: appBar, body: widget);

    return appHomePage;
  }

  Widget _selectedItemBuilder(
      BuildContext context, String itemName, Widget? child) {
    final widget = Text(
      itemName,
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }
}

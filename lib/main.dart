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
  final ValueNotifier<List<String>> _listItems =
      ValueNotifier(<String>['1', '2', '3']);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('ListView 範例'));

    final widget = ValueListenableBuilder<List<String>>(
        valueListenable: _listItems, builder: _listViewBuilder);

    final appHomePage = Scaffold(appBar: appBar, body: widget);

    return appHomePage;
  }

  Widget _listViewBuilder(
      BuildContext context, List<String> listItems, Widget? child) {
    final listView = ListView.separated(
        itemCount: listItems.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(
                listItems[index],
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                _listItems.value.add((_listItems.value.length + 1).toString());
                _listItems.value = List.from(_listItems.value);
              },
              onLongPress: () {
                _listItems.value.removeAt(index);
                _listItems.value = List.from(_listItems.value);
              },
            ),
        separatorBuilder: (context, index) => const Divider());

    return listView;
  }
}

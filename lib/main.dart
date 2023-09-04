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
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('ListView 範例'));

    var items = <String>['1', '2', '3'];
    var itemsLastNum = items.length;
    final GlobalKey<AnimatedListState> itemMenuKey = GlobalKey();

    final widget = AnimatedList(
        key: itemMenuKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => SizeTransition(
              sizeFactor: animation,
              child: ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(fontSize: 20),
                ),
                onTap: () {
                  items.add((++itemsLastNum).toString());
                  itemMenuKey.currentState?.insertItem(items.length - 1);
                },
                onLongPress: () {
                  var removeItem = items.removeAt(index);
                  var builder = (context, animation) => SizeTransition(
                        sizeFactor: animation,
                        child: ListTile(
                          title: Text(
                            removeItem,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                  itemMenuKey.currentState?.removeItem(index, builder);
                },
              ),
            ));

    final appHomePage = Scaffold(appBar: appBar, body: widget);

    return appHomePage;
  }
}

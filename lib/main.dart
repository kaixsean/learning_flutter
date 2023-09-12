import 'package:flutter/material.dart';

import 'package:flutter_app/select_drink.dart';
import 'package:flutter_app/select_main_course.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/select main course': (context) => SelectMainCourse(),
        '/select drink': (context) => SelectDrink()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ValueNotifier<String> _selectedMainCourse = ValueNotifier('');
  final ValueNotifier<String> _selectedDrink = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('點餐'));

    final btnSelectMainCourse = ElevatedButton(
        onPressed: () {
          _showMainCourseScreen(context);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            elevation: 8),
        child: const Text(
          '選擇主餐',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ));
    final btnSelectDrink = ElevatedButton(
      onPressed: () {
        _showDrinkScreen(context);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          elevation: 8),
      child: const Text(
        '選擇飲料',
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    );

    final row1 = Row(
      children: <Widget>[
        Expanded(
            child: Container(
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: ValueListenableBuilder<String>(
            builder: _selectedMainCourseBuilder,
            valueListenable: _selectedMainCourse,
          ),
        )),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: btnSelectMainCourse,
        )
      ],
    );

    final row2 = Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: ValueListenableBuilder<String>(
              builder: _selectedDrinkBuilder,
              valueListenable: _selectedDrink,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: btnSelectDrink,
        )
      ],
    );

    final widget = Column(
      children: <Widget>[row1, row2],
    );

    final appHomePage = Scaffold(appBar: appBar, body: widget);

    return appHomePage;
  }

  Widget _selectedMainCourseBuilder(
      BuildContext context, String mainCourse, Widget? child) {
    final widget = Text(
      mainCourse,
      style: const TextStyle(fontSize: 20),
    );
    return widget;
  }

  Widget _selectedDrinkBuilder(
      BuildContext context, String drink, Widget? child) {
    final widget = Text(
      drink,
      style: const TextStyle(fontSize: 20),
    );
    return widget;
  }

  _showMainCourseScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select main course');

    if (result != null) {
      _selectedMainCourse.value = result.toString();
    } else {
      _selectedMainCourse.value = '沒有選擇';
    }
  }

  _showDrinkScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/select drink');
    if (result != null) {
      _selectedDrink.value = result.toString();
    } else {
      _selectedDrink.value = '沒有選擇';
    }
  }
}

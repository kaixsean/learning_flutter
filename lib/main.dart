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
  static const _hobbies = <String>['游泳', '唱歌', '聽音樂', '騎單車', '旅遊', '美食'];
  final ValueNotifier<List<bool>> _hobbiesSelected =
      ValueNotifier(List<bool>.generate(_hobbies.length, (int index) => false));

  final ValueNotifier<String> _text = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('選擇興趣'));

    final btn = ElevatedButton(
        onPressed: () => _showHobbies(), child: const Text('確定'));

    final widget = Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: 200,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ValueListenableBuilder<List<bool>>(
                  builder: _hobbySelectionBuilder,
                  valueListenable: _hobbiesSelected,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: btn,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ValueListenableBuilder<String>(
                builder: _textWidgetBuilder,
                valueListenable: _text,
              ),
            )
          ],
        ),
      ),
    );

    final appHomePage = Scaffold(appBar: appBar, body: widget);

    return appHomePage;
  }

  Widget _hobbySelectionBuilder(
      BuildContext context, List<bool> hobbiesSelected, Widget? child) {
    List<CheckboxListTile> checkboxes = [];

    for (var i = 0; i < _hobbies.length; i++) {
      checkboxes.add(CheckboxListTile(
          title: Text(
            _hobbies[i],
            style: const TextStyle(fontSize: 20),
          ),
          value: _hobbiesSelected.value[i],
          onChanged: (newValue) {
            _hobbiesSelected.value[i] = newValue as bool;
            _hobbiesSelected.value = List.from(_hobbiesSelected.value);
          }));
    }

    final wid = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: checkboxes,
    );

    return wid;
  }

  Widget _textWidgetBuilder(BuildContext context, String text, Widget? child) {
    final wid = Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
    return wid;
  }

  _showHobbies() {
    String selectedHobbies = '';
    for (int i = 0; i < _hobbiesSelected.value.length; i++) {
      if (_hobbiesSelected.value[i]) selectedHobbies += _hobbies[i];
    }

    _text.value = selectedHobbies;
  }
}

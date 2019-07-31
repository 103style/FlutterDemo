import 'package:flutter/material.dart';

void main() {
  var title = 'update with input';
  runApp(MaterialApp(
    title: title,
    home: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Counter(),
    ),
  ));
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

class CounterState extends State<Counter> {
  int _count = 1;

  void onPressed() {
    setState(() {
      _count++;
    });
  }

  void onLongPress() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Listener(
          onPressedCallback: onPressed,
          longPressCallback: onLongPress,
        ),
        Display(
          count: _count,
        ),
      ],
    );
  }
}

class Display extends StatelessWidget {
  int count;

  Display({this.count});

  @override
  Widget build(BuildContext context) {
    return Text('Count = $count');
  }
}

class Listener extends StatelessWidget {
  VoidCallback onPressedCallback;
  VoidCallback longPressCallback;

  Listener({this.onPressedCallback, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
        onPressed: null,
        child: Text(
          'Presss and longPress',
          style: TextStyle(fontSize: 16.0, color: Colors.red),
        ),
      ),
      onTap: onPressedCallback,
      onLongPress: longPressCallback,
    );
  }
}

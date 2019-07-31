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
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: _increment,
          child: Text('Increment'),
        ),
        RaisedButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: _decrement,
          child: Text('decrement'),
        ),
        MaterialButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: _reset,
          child: Text('rest'),
          color: Colors.red,
          textColor: Colors.white,
        ),
        MaterialButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: null,
          child: Text('Count = $_count'),
        )
      ],
    );
  }
}

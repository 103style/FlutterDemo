import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: MyButton(),
  ));
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: GestureDetector(
        onTap: () {
          print('MyBtton was tapped');
        },
        child: Container(
          height: 64.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightGreen[500],
          ),
          child: Center(
            child: Text('Engage'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../common/common_utils.dart';

var title = 'Flutter Tutorial';

void main() {
  runApp(Gesuture());
}

class Gesuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBackTitle(
      title: title,
      bodyWidget: MyButton(),
    );
  }
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

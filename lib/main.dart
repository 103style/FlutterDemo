import 'package:flutter/material.dart';

void main() {
  var title = 'layout demo';

  runApp(MaterialApp(
    title: title,
    home: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

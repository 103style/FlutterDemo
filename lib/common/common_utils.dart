import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  String title;
  Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: bodyWidget,
      ),
    );
  }

  CommonTitle({@required this.title, @required this.bodyWidget});
}

class CommonBackTitle extends StatelessWidget {
  String title;
  Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: bodyWidget,
      ),
    );
  }

  CommonBackTitle({@required this.title, @required this.bodyWidget});
}

class CommonBackColorTitle extends StatelessWidget {
  String title;
  Widget bodyWidget;
  Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      color: color,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: bodyWidget,
      ),
    );
  }

  CommonBackColorTitle(
      {@required this.title, @required this.bodyWidget, @required this.color});
}

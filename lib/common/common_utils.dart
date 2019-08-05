import 'package:flutter/material.dart';

class CommonRounterTitle extends StatelessWidget {
  String title;
  Widget bodyWidget;
  Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: null, //当使用 initialRoute 时，需要确保你没有同时定义 home 属性。
      initialRoute: '/',
      routes: routes,
    );
  }

  CommonRounterTitle({
    @required this.title,
    @required this.bodyWidget,
    @required this.routes,
  });
}

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

  CommonTitle({
    @required this.title,
    @required this.bodyWidget,
  });
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

  CommonBackTitle({
    @required this.title,
    @required this.bodyWidget,
  });
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

  CommonBackColorTitle({
    @required this.title,
    @required this.bodyWidget,
    @required this.color,
  });
}

class CommonBackAndActionTitle extends StatelessWidget {
  String title;
  Widget bodyWidget;
  List<Widget> actions;

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
          actions: actions,
        ),
        body: bodyWidget,
      ),
    );
  }

  CommonBackAndActionTitle({
    @required this.title,
    @required this.bodyWidget,
    @required this.actions,
  });
}

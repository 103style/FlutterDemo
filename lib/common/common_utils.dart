import 'package:flutter/material.dart';

class CommonRouterTitle extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //当使用 initialRoute 时，需要确保你没有同时定义 home 属性。
      //home: null,
      initialRoute: '/',
      routes: routes,
    );
  }

  CommonRouterTitle({
    @required this.routes,
  });
}

class CommonTitle extends StatelessWidget {
  final String title;
  final Widget bodyWidget;

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
  final String title;
  final Widget bodyWidget;

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
  final String title;
  final Widget bodyWidget;
  final Color color;

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
  final String title;
  final Widget bodyWidget;
  final List<Widget> actions;

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

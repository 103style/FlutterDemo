import 'package:flutter/material.dart';

import '../common/common_utils.dart';

var title = 'Flutter Tutorial';

void main() {
  runApp(Tutorial());
}

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBackTitle(
      title: title,
      bodyWidget: TutorialHome(),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: () {
            print('menu');
          },
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                showDialog(context: context, child: Text('dialog'));
              })
        ],
      ),
      body: Center(
        child: Text('Hello world'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add');
        },
        tooltip: 'add',
        child: Icon(Icons.add),
      ),
    );
  }
}

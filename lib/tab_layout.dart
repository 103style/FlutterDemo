import 'package:flutter/material.dart';

import 'common/common_utils.dart';

void main() => runApp(TabLayoutWidget());

var title = 'Layout';

class TabLayoutWidget extends StatelessWidget {
  @override
  Widget build(context) => CommonBackTitle(title: title, bodyWidget: Body());
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(title),
          ),
        ),
        Divider(height: 1),
        Tab(),
      ],
    );
  }
}

class Tab extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CreateTabState();
  }
}

class CreateTabState extends State<Tab> {
  IconData select = Icons.home;

  _updateSelect(IconData iconData) {
    setState(() {
      select = iconData;
    });
  }

  Widget _getTab(IconData iconData, String txt) {
    bool selected = iconData == select;
    Color color = selected ? Colors.red[500] : Colors.grey;

    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          _updateSelect(iconData);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(iconData, color: color),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: Text(txt, style: TextStyle(color: color)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getTab(Icons.home, 'home'),
          _getTab(Icons.favorite, 'favorite'),
          _getTab(Icons.account_box, 'account'),
          _getTab(Icons.settings, 'settings'),
        ],
      ),
    );
  }
}

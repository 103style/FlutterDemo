import 'package:flutter/material.dart';

import '../common/common_utils.dart';
import '../widgets/click_listener.dart';
import '../widgets/gesture.dart';
import '../widgets/material_widget.dart';
import '../widgets/shopping_example.dart';
import '../widgets/update_with_input.dart';
import '../widgets/widget_use.dart';

var title = 'Widgets Demo';

void main() {
  runApp(WidgetsDemo());
}

class WidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBackTitle(
      title: title,
      bodyWidget: Body(),
    );
  }
}

class Body extends StatelessWidget {
  Widget _navigator(BuildContext context, String title, Widget widget) {
    return GestureDetector(
      child: MaterialButton(
        color: Colors.red,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _navigator(context, 'WidgetUse', WidgetUse()),
        _navigator(context, 'Flutter Tutorial', Tutorial()),
        _navigator(context, 'ClickListener', ClickListener()),
        _navigator(context, 'Gesuture', Gesuture()),
        _navigator(context, 'UpdateWithInput', UpdateWithInput()),
        _navigator(context, 'ShoppingExample', ShoppingExample()),
      ],
    );
  }
}

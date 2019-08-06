import 'package:flutter/material.dart';

import 'actions/action_demo.dart';
import 'common/common_utils.dart';
import 'fisrt_demo.dart';
import 'hello_world.dart';
import 'layout/layout_demo_with_action.dart';
import 'platform/custom_platform.dart';
import 'provider/shop_provider_demo.dart';
import 'widgets/widgets_demo.dart';

var title = 'Flutter Demo';

void main() {
  runApp(DemoList());
}

class DemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonTitle(
      title: title,
      bodyWidget: Body(),
    );
  }
}

class Body extends StatelessWidget {
  Widget _navigator(BuildContext context, String title, Widget widget) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _navigator(context, 'Hello World', HelloWorld()),
        _navigator(context, 'First Demo', FirstDemo()),
        _navigator(context, 'Action Demo', ActionDemo()),
        _navigator(context, 'Widgets Demo', WidgetsDemo()),
//        _navigator(context, 'layout demo', LayoutDemo()),
        _navigator(context, 'layout demo with action', LayoutDemoWithAction()),
        _navigator(context, 'ShopProviderDemo', ShopProviderDemo()),
        _navigator(context, 'CustomPlatForm', CustomPlatForm()),
      ],
    );
  }
}

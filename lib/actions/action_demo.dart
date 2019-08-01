import 'package:flutter/material.dart';

import '../actions/mange_own_state.dart';
import '../actions/mix-and-match_approach.dart';
import '../actions/parent_manges_state.dart';
import '../common/common_utils.dart';

var title = 'Action Demo';

void main() {
  runApp(ActionDemo());
}

class ActionDemo extends StatelessWidget {
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
        _navigator(context, 'ManagersOwnState', ManagersOwnState()),
        _navigator(context, 'ParentManagesState', ParentManagesState()),
        _navigator(context, 'MixAndMatchApproach', MixAndMatchApproach()),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'common/common_utils.dart';

void main() => runApp(AnimatedBuilder());

var title = 'Layout';

class AnimatedBuilder extends StatelessWidget {
  @override
  Widget build(context) => CommonBackTitle(title: title, bodyWidget: Body());
}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

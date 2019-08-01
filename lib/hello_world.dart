import 'package:flutter/material.dart';

import 'common/common_utils.dart';

void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBackTitle(
      title: 'Hello World',
      bodyWidget: Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../common/common_utils.dart';

void main() => runApp(RenderingAnimations());

var title = 'Rendering animations';

class RenderingAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBackTitle(title: title, bodyWidget: LogoApp());
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: GestureDetector(
          child: FlutterLogo(),
          onTap: () {
            controller.reset();
            controller.forward();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

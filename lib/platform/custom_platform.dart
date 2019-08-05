import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/common_utils.dart';

void main() {
  runApp(CustomPlatForm());
}

class CustomPlatForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonTitle(
      title: 'CustomPlatForm',
      bodyWidget: Platform(),
    );
  }
}

class Platform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatformState();
  }
}

// android -> app -> src -> main -> java -> com.a103style.first_flutter_app -> MainActivity
class _PlatformState extends State<Platform> {
  static const platform = const MethodChannel('Platform');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}

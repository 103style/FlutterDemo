import 'package:flutter/material.dart';

//hello world
//void main(){
//    runApp(
//      Center(
//        child: Text(
//          'Hello World',
//          textDirection: TextDirection.ltr,
//        ),
//      )
//    );
//}

void main() {
  TextStyle textStyle = TextStyle(
    color: Colors.red,
  );

  runApp(Center(
      child: Row(
    children: <Widget>[
      Text('Row1', style: textStyle),
      Text('Row2', style: textStyle),
      Text('Row3', style: textStyle),
      Text('Row4', style: textStyle),
      Text('Row5', style: textStyle),
    ],
  )));
}

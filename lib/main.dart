import 'package:first_flutter_app/my_first_dart_screen.dart';
import 'package:first_flutter_app/my_second_dart_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstDartScreen(),
      title: 'Title',
      theme: new ThemeData(primaryColor: Colors.black),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => MyFirstDartScreen(),
        '/b': (BuildContext context) => MySecondDartScreen(),
      },
    );
  }
}

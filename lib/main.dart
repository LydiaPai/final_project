import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: Nav(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:praktikum2/detail_screen.dart';
import 'package:praktikum2/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}





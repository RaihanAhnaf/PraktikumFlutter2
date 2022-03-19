import 'package:flutter/material.dart';
import 'package:praktikum2/model/tourism_place.dart';
import 'package:praktikum2/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneTourismProvider(),
      child: MaterialApp(
        title: 'Contacts',
        theme: ThemeData(),
        home: MainScreen(),
      ),
    );
  }
}





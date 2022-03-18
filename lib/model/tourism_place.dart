import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:praktikum2/done_tourism_list.dart';
import 'package:praktikum2/tourism_list.dart';

class TourismPlace {
  String name;
  String location;
  String imageAsset;
  String day;
  String time;
  String ticket;
  String desc;
  List<String> galery;

  TourismPlace({
    required this.name,
    required this.location,
    required this.imageAsset,
    required this.day,
    required this.time,
    required this.ticket,
    required this.desc,
    required this.galery,
  });
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  final List<TourismPlace> doneTourismPlaceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Indonesia'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.done_outline),
              onPressed: (){
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context){
                    return DoneTourismList(
                        doneTourismPlaceList: doneTourismPlaceList
                    );
                  }),
                );
              },
          ),
        ],
      ),
      body: TourismList(doneTourismPlaceList: doneTourismPlaceList),
    );
  }
}
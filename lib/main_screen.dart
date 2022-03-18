import 'package:flutter/material.dart';
import 'package:praktikum2/detail_screen.dart';
import 'package:praktikum2/model/tourism_place.dart';


class MainScreen extends StatelessWidget {
  get tourismPlaceList => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bersama'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final TourismPlace place = tourismPlaceList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(place: place);
                }));
              },
              // child: listItem(place),
            );
          },
          itemCount: tourismPlaceList.length,
        ),
    );
  }
}

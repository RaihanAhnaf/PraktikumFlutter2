import 'package:flutter/material.dart';
import 'package:praktikum2/detail_screen.dart';
import 'package:praktikum2/model/tourism_place.dart';

class MainScreen extends StatelessWidget {

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
              child: listItem(place),
            );
          },
          itemCount: tourismPlaceList.length,
        ),
    );
  }

  Widget listItem(TourismPlace place){
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Expanded(
            flex: 1,
            child:
            Image(
              image: AssetImage(place.imageAsset),
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                  Text(
                    place.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(place.location),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

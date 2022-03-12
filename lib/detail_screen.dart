import 'package:flutter/material.dart';
import 'package:praktikum2/model/tourism_place.dart';

class DetailScreen extends StatelessWidget{
  const DetailScreen({required this.place});
  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              SizedBox(
                height: 300,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                  ),
                  child: FittedBox (
                    fit: BoxFit.cover,
                    child: ClipRRect(
                      child: Image.asset(place.imageAsset)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    Column(
                      children: <Widget> [
                        Icon(Icons.calendar_today),
                        Text(place.day),
                      ],
                    ),
                    Column(
                      children: <Widget> [
                        Icon(Icons.watch_later_outlined),
                        Text(place.time)
                      ],
                    ),
                    Column(
                      children: <Widget> [
                        Icon(Icons.attach_money_outlined),
                        Text(place.ticket)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  place.desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                child: SizedBox(
                  height: 166,
                  child: listGalery(place),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listGalery(TourismPlace place){
    return ListView(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      scrollDirection: Axis.horizontal,
      children: place.galery
        .map(
              (item) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(item),
                ),
              ),
      )
        .toList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:praktikum2/model/tourism_place.dart';

class DetailScreen extends StatelessWidget{
  const DetailScreen({required this.place});
  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Image.asset(place.imageAsset),
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
                    children: const <Widget> [
                      Icon(Icons.calendar_today),
                      Text("Open Everyday"),
                    ],
                  ),
                  Column(
                    children: const <Widget> [
                      Icon(Icons.watch_later_outlined),
                      Text("08:00 - 16:00")
                    ],
                  ),
                  Column(
                    children: const <Widget> [
                      Icon(Icons.attach_money_outlined),
                      Text("Rp 10.000,-")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintained. Car park cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it is a russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        'assets/images/monkasel_1.JPG'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        'assets/images/monkasel_2.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        'assets/images/monkasel_3.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:praktikum2/model/tourism_place.dart';
import 'package:praktikum2/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class DoneTourismList extends StatelessWidget {
  const DoneTourismList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(
          context,
          listen: false,
        ).doneTourismPlaceList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Telah Dikunjungi'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final TourismPlace place = doneTourismPlaceList[index];
            return Card(
              color: Colors.white60,
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
                  Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.done_outline),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return const DoneTourismList();
                            }),
                          );
                        },
                      ),
                  ),
                ],
              ),
            );
          },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }
}

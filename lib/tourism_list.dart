import 'package:flutter/material.dart';
import 'package:praktikum2/detail_screen.dart';
import 'package:praktikum2/list_item.dart';
import 'package:praktikum2/model/tourism_place.dart';
import 'package:praktikum2/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key}) : super(key: key);
  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda',
      imageAsset: 'assets/images/submarine.jpg',
      day: 'Open Everyday',
      time: '08:00 - 16:00',
      ticket: 'Rp 10.000,-',
      desc: "Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintained. Car park cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it is a russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine.",
      galery: ['assets/images/monkasel_1.JPG','assets/images/monkasel_2.jpg', 'assets/images/monkasel_3.jpg'],
    ),
    TourismPlace(
      name: 'Klenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/klenteng.jpg',
      day: 'Open Everyday',
      time: '05:00 - 20:00',
      ticket: 'Rp 0,-',
      desc: 'Sanggar Agung Temple or Hong San Tang is a Chinese temple in Surabaya dedicated to Chinese deities and other Asian religious icons. It is located within the Pantai Ria amusement park and has become a tourist destination, even though it is originally a worship place for Tridharma followers.',
      galery: ['assets/images/klenteng_1.jpg','assets/images/klenteng_2.jpg', 'assets/images/klenteng_3.jpg'],
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Krembengan Utara',
      imageAsset: 'assets/images/sampoerna.jpg',
      day: 'Open Everyday',
      time: '09:00 - 18:00',
      ticket: 'Rp 20.000,-',
      desc: 'The House of Sampoerna is a tobacco museum and headquarters of Sampoerna located in Surabaya. The main buildings architectural style influenced by Dutch colonial-style compound was built in 1862, and is now a preserved historical site.',
      galery: ['assets/images/sampoerna_1.jpg','assets/images/sampoerna_2.jpg', 'assets/images/sampoerna_3.jpg'],
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun-alun contong',
      imageAsset: 'assets/images/pahlawan.jpg',
      day: 'Open Everyday',
      time: '06:00 - 18:00',
      ticket: 'Rp 15.000,-',
      desc: 'The Heroes Monument is a monument in Surabaya, Indonesia. It is the main symbol of the city, dedicated to the people who died during the Battle of Surabaya on 10 November 1945. The 10 November Museum is located under the monument. This monument is 41.15 metres tall and is phallus-shaped.',
      galery: ['assets/images/pahlawan_1.jpg','assets/images/pahlawan_2.jpg', 'assets/images/pahlawan_3.jpg'],
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/suroboyo.jpg',
      day: 'Open Everyday',
      time: '08:00 - 17:00',
      ticket: 'Rp 0,-',
      desc: 'Landmark statue symbolic of Surabaya city, featuring a shark & crocodile tussling amid seaweed.',
      galery: ['assets/images/suroboyo_1.jpg','assets/images/suroboyo_2.jpg', 'assets/images/suroboyo_3.jpg'],
    ),
    TourismPlace(
      name: 'Pantai Papuma',
      location: 'Wuluhan',
      imageAsset: 'assets/images/papuma.jpg',
      day: 'Open Everyday',
      time: '00:00 - 24:00',
      ticket: 'Rp 20.000,-',
      desc: 'By a forest, this curved white-sand beach with turquoise water features scenic sunrises & sunsets.',
      galery: ['assets/images/papuma_1.jpg','assets/images/papuma_2.jpg', 'assets/images/papuma_3.jpg'],
    ),
    TourismPlace(
      name: 'Gunung Ijen',
      location: 'Bondowoso',
      imageAsset: 'assets/images/ijen.jpg',
      day: 'Open Everyday',
      time: '00:00 - 24:00',
      ticket: 'Rp 15.000,-',
      desc: 'The Ijen volcano complex is a group of composite volcanoes located on the border between Banyuwangi Regency and Bondowoso Regency of East Java, Indonesia. It is known for its blue fire, acidic crater lake, and labour-intensive sulfur mining.',
      galery: ['assets/images/ijen_1.jpeg','assets/images/ijen_2.jpg', 'assets/images/ijen_3.jpg'],
    ),
    TourismPlace(
      name: 'Pantai Double Six',
      location: 'Badung',
      imageAsset: 'assets/images/doublesix.png',
      day: 'Open Everyday',
      time: '00:00 - 24:00',
      ticket: 'Rp 20.000,-',
      desc: 'Originally a separate township, this is now another suburb of Kuta. This area is very popular with resident expatriates; land and accommodation prices are amongst the highest in Bali. Plenty of luxury spas and hotels abound. Owing to its high density of high-end shopping, combined with the clustering of many fine eating establishments, it has rapidly become one of the most well-known tourist areas on the island. ',
      galery: ['assets/images/doublesix_1.jpg','assets/images/doublesix_2.jpg', 'assets/images/doublesix_3.jpg'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(place: place);
              }));
            },
            child: Consumer(
                builder: (context, DoneTourismProvider data, widget){
                  return ListItem(
                    place: place,
                    isDone: data.doneTourismPlaceList.contains(place),
                    onCheckboxClick: (bool? value){
                      setState(() {
                        if(value!=null){
                          value
                              ? data.doneTourismPlaceList.add(place)
                              : data.doneTourismPlaceList.remove(place);
                        }
                      });
                    },
                  );
                }
            ),
          );
        },
        itemCount: tourismPlaceList.length,
    );
  }
}

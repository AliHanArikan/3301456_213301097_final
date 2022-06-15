
import 'package:flutter/material.dart';

import '../antrenmanlar_screens/antrenman_bacak.dart';
import '../antrenmanlar_screens/antrenmanlar_kol.dart';

class RutinSec extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RutinSecState();
  }
}

class _RutinSecState extends State {
  List<dynamic> sayfalar = [AntrenmanBacakEkran(), AntrenmanlarKol()];
  List<dynamic> sayfaIsimleri = [
    "Bacak Antrenmanı",
    "Kol Antrenmanı",
    "Göğüs Antrenmanı",
    "Sırt Antrenmanı",
    "Omuz Anternmanı",
    "Karın Antrenmanı"
  ];
  List<dynamic> sayfaFotograflari = [
    "https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg",
    "https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg",
    "https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg",
    "https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg",
    "https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg",
    "https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorev ekle"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: sayfaIsimleri.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade500, width: 10),
                  //borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.red,
                      offset: new Offset(10.0, 5.0),
                      blurRadius: 10.0,
                    )
                  ],
                  shape: BoxShape.circle,
                  color: Colors.blue[100 * ((index + 1) % 8)],
                  gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.red],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  image: DecorationImage(
                      image: AssetImage("assets/images/body_workout.jpg"),
                    //image: NetworkImage(sayfaFotograflari[index].toString()),
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter)),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "${sayfaIsimleri[index].toString()}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                     // color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // onTap: () => debugPrint("Merhaba flutter $index tıklanıldı"),
            onTap: () {
              debugPrint(
                  "Merhaba flutter ${sayfalar[index].toString()} tıklanıldı");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => sayfalar[index]));
            },
            onDoubleTap: () =>
                debugPrint("Merhaba flutter $index çift tıklanıldı"),
            onLongPress: () =>
                debugPrint("Merhaba flutter $index uzun basıldı"),
            onHorizontalDragStart: (e) =>
                debugPrint("Merhaba flutter $index uzun basıldı $e"),
          );
        },
      ),
    );
  }
}

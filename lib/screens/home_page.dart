

import 'package:flutter/material.dart';

import '../firebase_firestore_islemleri/veritabani_antrenman_kaydet.dart';




import 'giris_yap.dart';
import 'kayit_ol.dart';
import 'rutin_sec.dart';
import 'show_gorevs.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State {
  String? url="https://images.pexels.com/photos/421160/pexels-photo-421160.jpeg?cs=srgb&dl=pexels-kinkate-421160.jpg&fm=jpg";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Hayatını Planla"),
          centerTitle: true,
          backgroundColor: Colors.lime.shade800,
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/bodyyy.jpg',
                      fit: BoxFit.cover,
                    ))),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowGorevs()));
              },
              icon: Icon(Icons.show_chart),
              label: Text("Antrenman PRogramını Göster"),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber.shade50,
                  shape: StadiumBorder(),
                  side: BorderSide( width: 1)
              ),
            ),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RutinSec()));
                  },
                  icon: Icon(Icons.show_chart),
                  label: Text("Rutin sec"),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber.shade50,
                      shape: StadiumBorder(),
                      side: BorderSide( width: 1)
                  ),
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VeritabaniAntrenmanKaydet()));
                    },
                    icon: Icon(Icons.show_chart),
                    label: Text("VeriTabanina Antrenman Kaydet"),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber.shade50,
                      shape: StadiumBorder(),
                      side: BorderSide( width: 1),
                    ),
                  ),
                ),
              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KayitOl()));
                  },
                  icon: Icon(Icons.show_chart),
                  label: Text("Kayıt Ol"),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber.shade50,
                      shape: StadiumBorder(),
                      side: BorderSide( width: 1)
                  ),

                ),
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GirisYap()));
                    },
                    icon: Icon(Icons.login),
                    label: Text("Giriş Yap"),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.amber.shade50,
                         shape: StadiumBorder(),
                         side: BorderSide( width: 1)
                    ),
                ),
                
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: 200,
                       child: Image.asset(
                          'assets/images/body_workout.jpg',
                          fit: BoxFit.fill,
                        )
                      //child: Image.network(url!),
                    )
                ),
                Expanded(
                    child: Container(
                        height: 200,
                        child: Image.asset(
                          'assets/images/body2.jpg',
                          fit: BoxFit.fill,
                        ))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              ],
            ),
          ],
        )));
  }
}

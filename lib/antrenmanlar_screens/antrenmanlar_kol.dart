import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models_antrenmanlar/antrenman_kol.dart';

class AntrenmanlarKol extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AntenmanlarKolState();
  }

}

class _AntenmanlarKolState extends State {
  AntrenmanKol hareketler=new AntrenmanKol();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bacak Antrenmanı"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: hareketler.hareketlerKol.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade200,width: 20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/body_workout.jpg"),
                        //image: NetworkImage(sayfaFotograflari[index].toString()),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    hareketler.hareketlerKol[index].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                       color: Colors.orange.shade200
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

}
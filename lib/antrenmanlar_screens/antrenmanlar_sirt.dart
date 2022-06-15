import 'package:arikan06/models_antrenmanlar/antrenman_omuz.dart';
import 'package:arikan06/models_antrenmanlar/antrenman_sirt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AntrenmanSirtEkran extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AntrenmanSirtEkranState();
  }

}

class _AntrenmanSirtEkranState extends State{
  AntrenmanSirt hareketler = new AntrenmanSirt();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bacak Antrenmanı"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: hareketler.hareketler.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink.shade200,width: 20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/bodyyy.jpg"),
                        //image: NetworkImage(sayfaFotograflari[index].toString()),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    hareketler.hareketler[index].toString(),
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
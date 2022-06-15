import 'package:arikan06/models_antrenmanlar/antrenman_karin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AntrenmanKarinEkran extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AntrenmanKarinEkranState();
  }

}

class _AntrenmanKarinEkranState extends State{
  AntrenmanKarin antrenman = new AntrenmanKarin();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bacak Antrenmanı"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: antrenman.hareketler.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(

              child: Container(

                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade50, width: 20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/bodyyy.jpg"),
                        //image: NetworkImage(sayfaFotograflari[index].toString()),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter)
                ),
                child: Padding(

                  padding: EdgeInsets.all(10),
                  child: Text(
                    antrenman.hareketler[index].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.orange.shade200),
                  ),

                ),
              ),
            );
          }),
    );
  }

}
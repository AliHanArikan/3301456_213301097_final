

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../models/gorev.dart';

class ShowGorevDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShowGorevDetailsState(selectedGorev!);
  }
  Gorev? selectedGorev = Gorev.withId(id: 0,isim: "",baslangicZamani: 0,bitisZamani: 0,aciklama: "",tamamlandiMi: 0);
  ShowGorevDetails(Gorev? gorev){
    this.selectedGorev=gorev;
  }

}

class _ShowGorevDetailsState extends State{
  Gorev selectedGorev = Gorev.withId(id: 0,isim: "",baslangicZamani: 0,bitisZamani: 0,aciklama: "",tamamlandiMi: 0);
  _ShowGorevDetailsState(Gorev? gorev){
    this.selectedGorev=gorev!;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Görev Detayları"),
        centerTitle: true,
        titleSpacing: 30.0,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(

        children: <Widget>[

          Container(
            width: 400,
            height: 100,
            color: Colors.yellowAccent,
            child: Text(selectedGorev.isim.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),),
          ),

          Container(
            width: 400,
            height: 100,
            color: Colors.purple,
            child: Text(selectedGorev.aciklama.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),),
          ),



          Container(
            width: 400,
            height: 100,
            color: Colors.deepOrange,
            child: Text("Başlangıç zamanı:   "+selectedGorev.baslangicZamani.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),),
          ),

          Container(
            width: 400,
            height: 100,
            color: Colors.lightGreenAccent,
            child: Text("Bitiş zamanı:   "+selectedGorev.bitisZamani.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),),
          )

        ],
      )

            //Text("Container",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),),








    );
  }

}
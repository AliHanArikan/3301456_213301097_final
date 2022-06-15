import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models_antrenmanlar/antrenman_bacak.dart';
import '../models_antrenmanlar/antrenman_kol.dart';

class AntrenmanBacakEkran extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AntrenmanBacakState();
  }
}

class _AntrenmanBacakState extends State {
  List<String> program = ["on bacak", "ic bacak"];

  AntrenmanBacak antrenmanBacak = new AntrenmanBacak();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Bacak Antrenmanı"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: antrenmanBacak.hareketler.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade50, width: 20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    antrenmanBacak.hareketler[index].toString(),
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



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../data/db_helper.dart';
import '../models/gorev.dart';

class GorevEdit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GorevEditState(selectedGorev!);
  }

  Gorev? selectedGorev = new Gorev.withId(id: 0,baslangicZamani: 0,bitisZamani: 0,aciklama: "",isim: "",tamamlandiMi: 0);
  GorevEdit(Gorev gorev){
      selectedGorev = gorev;
  }
}

class _GorevEditState extends State {
  var txtIsim = TextEditingController();
  var txtAciklama = TextEditingController();
  var txtBaslangicZamani = TextEditingController();
  var txtBitisZamani = TextEditingController();

  var dbHelper = new DbHelper();
  var formKey = GlobalKey<FormState>();
  Gorev? selectedGorev = new Gorev.withId(id: 0,
      baslangicZamani: 0,
      bitisZamani: 0,
      aciklama: "",
      isim: "",
      tamamlandiMi: 0);

  _GorevEditState(Gorev gorev) {
    this.selectedGorev = gorev;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorev Düzenle"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),

        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildIsimField(),
              buildAciklamaField(),
              buildBaslangicZamaniField(),
              buildBitisZamaniField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildIsimField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Gorev ismi"),
      controller: txtIsim,

      onSaved: (String? value){
      selectedGorev!.isim=value;
      }
    );
  }

  buildAciklamaField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Gorev Aciklamasi"),
      controller: txtAciklama,

        onSaved: (String? value){
          selectedGorev!.aciklama=value;
        }
    );
  }

  buildBaslangicZamaniField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Baslangic Zamani"),
      controller: txtBaslangicZamani,
        onSaved: (String? value){
          selectedGorev!.baslangicZamani=int.parse(value.toString());
        }
    );
  }

  buildBitisZamaniField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Bitiş Zamani"),
      controller: txtBitisZamani,
        onSaved: (String? value){
          selectedGorev!.bitisZamani=int.parse(value.toString());
        }
    );
  }

  Widget buildSubmitButton()  {
    return ElevatedButton(
      child: Text("Kaydet"),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(8.0),

          shape: MaterialStateProperty.all(
              const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              )
          )
      ),
      onPressed: (){
        EditGorevv();

      },
    );
  }

  void EditGorevv() async {
    formKey.currentState?.save();
      print(selectedGorev!.isim);
    var result = await dbHelper.update(selectedGorev!);

    Navigator.pop(context);
  }
}
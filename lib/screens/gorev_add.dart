import 'package:flutter/material.dart';


import '../data/db_helper.dart';
import '../models/gorev.dart';

class GorevAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GorevAddState();
  }
}

class _GorevAddState extends State {
  var dbHelper = new DbHelper();
  var txtIsim = TextEditingController();
  var txtAciklama = TextEditingController();
  var txtBaslangicZamani = TextEditingController();
  var txtBitisZamani = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorev ekle"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                buildIsimField(),
                buildAciklamaField(),
                buildBaslangicZamaniField(),
                buildBitisZamaniField(),
                buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildIsimField() {
    return Container(
      

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(fontWeight: FontWeight.bold),
          cursorRadius: Radius.circular(20),
          decoration: InputDecoration(
              labelText: 'Gorev ismi',

              prefixIcon: Icon(Icons.password),
              //suffixIcon: Icon(Icons.access_alarm),

              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(18.0)
                  )
              )
          ),
          controller: txtIsim,
        ),
      ),
    );
  }

  buildAciklamaField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Gorev Aciklamasi',

            prefixIcon: Icon(Icons.password),
            //suffixIcon: Icon(Icons.access_alarm),

            border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(18.0)
                )
            )
        ),
        controller: txtAciklama,
      ),
    );
  }

  buildBaslangicZamaniField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Baslangic zamani',

            prefixIcon: Icon(Icons.password),
            //suffixIcon: Icon(Icons.access_alarm),

            border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(18.0)
                )
            )
        ),
        controller: txtBaslangicZamani,
      ),
    );
  }

  buildBitisZamaniField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Bitis zamani',

            prefixIcon: Icon(Icons.password),
            //suffixIcon: Icon(Icons.access_alarm),

            border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(18.0)
                )
            )
        ),
        controller: txtBitisZamani,
      ),
    );
  }

  buildSaveButton() {
    return FlatButton(
      color: Colors.lightGreenAccent,
      child: Text("Yeni Görev Ekle"),
      onPressed: () {
        addGorev();
      },
    );
  }

  void addGorev() async {
    print("brası calisiyor");
    print(txtIsim.text.toString());
    var result = await dbHelper.insert(Gorev(
        isim: txtIsim.text.toString(),
        bitisZamani: int.parse(txtBitisZamani.text.toString()),
        baslangicZamani: int.parse(txtBaslangicZamani.text.toString()),
        aciklama: txtAciklama.text.toString()));
    dbHelper.getGorevs;

    Navigator.pop(context, true);
  }
}

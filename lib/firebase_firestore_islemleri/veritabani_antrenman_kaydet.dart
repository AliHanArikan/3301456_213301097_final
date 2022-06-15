import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VeritabaniAntrenmanKaydet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VeritabaniAntrenmanKaydet();
  }

}

class _VeritabaniAntrenmanKaydet extends State {
  var formKey = GlobalKey<FormState>();
  String? isim;
  String? uygulamaAdi;
  String? gecenDakika;
  String? setSayisi;
  String? tekrarSayisi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Antrenman Kaydet"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLength: 30,
                      cursorColor: Colors.pink,
                      onSaved: (deger) {
                        isim = deger!;
                      },
                      decoration: InputDecoration(
                          labelText: 'İsim girin',
                          hintText: 'isim giriniz',
                          // prefixIcon: Icon(Icons.email),

                          //suffixIcon: Icon(Icons.access_alarm),

                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(18.0)))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextFormField(
                      maxLength: 30,
                      cursorColor: Colors.pink,
                      onSaved: (deger) {
                        uygulamaAdi = deger!;
                      },
                      decoration: InputDecoration(
                          labelText: 'Yaptığını hareket ismini giriniz',
                          hintText: 'uygulama adi',
                          //prefixIcon: Icon(Icons.password),
                          //suffixIcon: Icon(Icons.access_alarm),

                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(18.0)))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLength: 30,
                      cursorColor: Colors.pink,
                      onSaved: (deger) {
                        setSayisi = deger!.toString();
                      },
                      decoration: InputDecoration(
                          labelText: 'Set sayisi',
                          hintText: 'Set sayisi',
                          //prefixIcon: Icon(Icons.password),
                          //suffixIcon: Icon(Icons.access_alarm),

                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(18.0)))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLength: 30,
                      cursorColor: Colors.pink,
                      onSaved: (deger) {
                        tekrarSayisi = deger!.toString();
                      },
                      decoration: InputDecoration(
                          labelText: 'Tekrar Sayisi',
                          hintText: 'Tekrar Sayisi',
                          //prefixIcon: Icon(Icons.password),
                          //suffixIcon: Icon(Icons.access_alarm),

                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(18.0)))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLength: 30,
                      cursorColor: Colors.pink,
                      onSaved: (deger) {
                        gecenDakika = deger!.toString();
                      },
                      decoration: InputDecoration(
                          labelText: 'Gecen Dakika',
                          hintText: 'Gecen Dakika',
                          //prefixIcon: Icon(Icons.password),
                          //suffixIcon: Icon(Icons.access_alarm),

                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(18.0)))),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      formKey.currentState!.save();
                      // KullaniciyiKaydet(email,sifre);
                      try {
                        antrenmanKaydet();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(
                            "Başarıyla giriş yapıldı")));
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("t")));
                      }
                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Antenman Kaydet'),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }

  Future<void> antrenmanKaydet() async {
    var _yenikullaniciId = firestore
        .collection('kullanici')
        .doc()
        .id;
    await firestore.doc('kullanici/$_yenikullaniciId').set(
        {'isim': isim.toString(),
         'userId': _yenikullaniciId,
         'uygulamaAdi': uygulamaAdi.toString(),
        'tekrarSayisi': tekrarSayisi.toString(),
        'setSayisi': setSayisi.toString(),
        'gecenDakika': gecenDakika.toString()
        });
    // Map<String,dynamic> eklenecekAntrenman=<String,dynamic>{};
    // eklenecekAntrenman['isim']=isim.toString();
    // eklenecekAntrenman['uygulamaAdi']=uygulamaAdi.toString();
    // eklenecekAntrenman['tekrarSayisi']=tekrarSayisi.toString();
    // eklenecekAntrenman['setSayisi']=setSayisi.toString();
    // eklenecekAntrenman['gecenDakika']=gecenDakika.toString();
    //
    // await firestore.collection('kullanici').add(eklenecekAntrenman);
  }
}
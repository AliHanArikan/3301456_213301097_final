import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KayitOl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KayitOlState();
  }
}

class _KayitOlState extends State {
  TextEditingController? _kullaniciAdiController;
  TextEditingController? _sifre;
  String? email = " ";
  String? sifre = " ";
  var formKey = GlobalKey<FormState>();

  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    _kullaniciAdiController = TextEditingController(text: 'alihan');
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Kayit Ol Sayfası"),
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
                    padding: EdgeInsets.all(16.0),
                    child: TextFormField(
                      maxLength: 30,
                      cursorColor: Colors.pink,
                      onSaved: (deger) {
                        email = deger!;
                      },
                      decoration: InputDecoration(
                          labelText: 'İsim girin',
                          hintText: 'email giriniz',
                          prefixIcon: Icon(Icons.email),

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
                        sifre = deger!;
                      },
                      decoration: InputDecoration(
                          labelText: 'sifre giriniz',
                          hintText: 'enter password',
                          prefixIcon: Icon(Icons.password),
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
                      var userCredentinel= await auth.createUserWithEmailAndPassword(email: email!, password: sifre!);

                      print(userCredentinel.toString());
                      String? result="isim : $email \n sifre: $sifre";
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Kayıt Ol'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      formKey.currentState!.save();
                      // KullaniciyiKaydet(email,sifre);
                      await auth.signInWithEmailAndPassword(email: email!, password: sifre!);


                      String? result="isim : $email \n sifre: $sifre";
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Giriş YAp'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void KullaniciyiKaydet(String? emaill, String? sifre) async{
    var userCredentinel= await auth.createUserWithEmailAndPassword(email: emaill!, password: sifre!);

    print(userCredentinel.toString());
    print("calisti");
  }
}

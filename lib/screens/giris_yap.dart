import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GirisYap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GirisYapState();
  }
}

class _GirisYapState extends State {
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

    auth.authStateChanges()
        .listen((User? user) {
      if (user == null) {
        debugPrint("user oturumu kapalı");
      } else {
        debugPrint("user oturumu açık ${user.email} ve email durumu ${user.emailVerified}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const String hataMesaji="Kullanici Adi veya Şifre Yanlış";
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Giris Yap"),
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
                      try{
                        await auth.signInWithEmailAndPassword(
                            email: email!, password: sifre!);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Başarıyla giriş yapıldı")));
                      }catch(e){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(hataMesaji)));
                      }

                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Giriş YAp'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      formKey.currentState!.save();
                      // KullaniciyiKaydet(email,sifre);
                      try{
                        await auth.signOut();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Başarıyla Çıkış yapıldı")));
                      }catch(e){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(hataMesaji)));
                      }

                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Çıkış yap'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      formKey.currentState!.save();
                      // KullaniciyiKaydet(email,sifre);
                      try{
                        if(auth.currentUser != null){
                          await auth.currentUser!.delete();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Başarıyla Çıkış yapıldı")));
                        }else{
                          String? mesaj="lütfen önce oturum açınız";
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(mesaj)));
                        }


                      }catch(e){
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(hataMesaji)));
                      }

                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Hesabı sil'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


import 'dart:async';



import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/gorev.dart';



class DbHelper{
  Database? _db;


  Future<Database?> get db async{
    print("hata5");
    if(_db == null){
      _db = await initializeDb();
    }
    print("hata4");
    return _db;
  }


  //Future<Database?> initializeDb() async {
  // String dbPathh = join(await getDatabasesPath(),"gorevler.db");
  //print("buraya geldi");
  // var GorevlerDb = await openDatabase(dbPath,version: 1,onCreate: createDb);
  //var GorevlerDb =await openDatabase(dbPathh,version: 1,onCreate: createDb);
  //print("Tablo oluşturuluyor");

  //return GorevlerDb;
  //}

  //  createDb(Database db, int version) async{
  // print("hata1");
  // await db.execute("CREATE TABLE gorev(id INTEGER PRIMARY KEY,isim TEXT,aciklama TEXT,bitisZamani INTEGER,baslangicZamani INTEGER,tamamlandiMi INTEGER)");
  //}
  Future<Database?> initializeDb() async {
    String dbPath = join(await getDatabasesPath(),"gorevv.db");
    var GorevDb = await openDatabase(dbPath,version: 1,onCreate: createDb);
    print("Tablo oluşturuluyor");
    return GorevDb;
  }




  void createDb(Database db, int version) async {

    await db.execute("CREATE TABLE gorevs(id INTEGER PRIMARY KEY,isim TEXT, aciklama TEXT,baslangicZamani INTEGER,bitisZamani INTEGER,tamamlandiMi INTEGER)");
    print("Tablo olosturuldu");


  }


  Future<List<Gorev>?> get getGorevs async{
    Database? db = await this.db;
    print("hata2");
    var result = await db?.query("gorevs");

    return List.generate(result!.length, (index){
      return Gorev.fromObject(result[index]);
    });
  }

  Future<int?> insert(Gorev gorev) async{
    Database? db = await this.db;
    var result = await db?.insert("gorevs", gorev.toMap());
    return result;
  }

  Future<int?> delete(int id) async{
    Database? db = await this.db;

    var result= await db!.rawDelete("DELETE FROM gorevs where id= $id ");
  }


  Future<int?> update(Gorev gorev) async{
    Database? db= await this.db;

    var result= await db!.update("gorevs",gorev.toMap(), where: "id=?",whereArgs: [gorev.id] );
    return result;
  }



}
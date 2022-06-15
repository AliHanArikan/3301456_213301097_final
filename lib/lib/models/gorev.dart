
class Gorev{
  int? id;
  int? baslangicZamani;
  int? bitisZamani;
  String? isim;
  String? aciklama;
  int? tamamlandiMi;
  Gorev.withId({this.id,this.baslangicZamani,this.bitisZamani,this.aciklama,this.isim,this.tamamlandiMi=0});
  Gorev({this.baslangicZamani,this.bitisZamani,this.aciklama,this.isim,this.tamamlandiMi=0});

  Map<String,dynamic> toMap(){
    var map= Map<String,dynamic>();
    map["isim"]=this.isim.toString();
    map["aciklama"]= this.aciklama.toString();
    map["baslangicZamani"]=this.baslangicZamani!.toInt();
    map["bitisZamani"]=this.bitisZamani!.toInt();
    map["tamamlandiMi"]=this.tamamlandiMi!.toInt();
    if(id != null){
      map["id"]=this.id;
    }
    return map;
  }

  Gorev.fromObject(dynamic o){
    this.id = o["id"].toInt();
    this.baslangicZamani=o["baslangicZamani"].toInt();
    this.bitisZamani = o["bitisZamani"].toInt();
    this.isim=o["isim"].toString();
    this.aciklama=o["aciklama"].toString();
    this.tamamlandiMi=o["tamamlandiMi"].toInt();

  }

}

class Antrenman{
   int? tekrar_sayisi;
   int? set_sayisi;
  int? zaman;
  int? harcanan_kalori;
  String? isim;
  String? aciklama;
 Antrenman({isim,aciklama,tekrar_sayisi,set_sayisi,zaman,harcanan_kalori});

 Map<String,dynamic> toMap(){
   var map= Map<String,dynamic>();
   map["isim"]=this.isim.toString();
   map["aciklama"]=this.aciklama.toString();
   map["zaman"]=this.zaman.toString();
   map["harcanan_kalori"]=this.harcanan_kalori.toString();
   map["set_sayisi"]=this.set_sayisi.toString();
   map["tekrar_sayisi"]=this.tekrar_sayisi.toString();

   return map;
 }


 Antrenman.fromObject(dynamic o){
    this.isim=o["isim"].toString();
    this.aciklama=["aciklama"].toString();
    this.zaman=["zaman"] as int?;
    this.tekrar_sayisi=["tekrar_sayisi"] as int?;
    this.set_sayisi=["set_sayisi"] as int?;
    this.harcanan_kalori=["harcanan_kalori"] as int?;
 }


























}
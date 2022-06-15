import 'package:arikan06/models_antrenmanlar/antrenman.dart';

class AntrenmanGogus extends Antrenman{
  String? hareket_ismi;
  List<String> hareketler = [
    "Barbell Bench Press",
    "Dumbell Bench Press",
    "Decline Dumbell Press",
    "Push Up:",
    "İncline Dumbell Press:",
    "M.Pectoralis Major",
    "M.Pectoralis Majorg",

  ];

  AntenmanGogus() {}

  AntrenmanGogus(
      {isim,
        aciklama,
        tekrar_sayisi,
        set_sayisi,
        zaman,
        harcanan_kalori,
        hareket_ismi})
      : super(
    isim: isim,
    aciklama: aciklama,
    tekrar_sayisi: tekrar_sayisi,
    set_sayisi: set_sayisi,
    zaman: zaman,
    harcanan_kalori: harcanan_kalori,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["isim"] = super.isim.toString();
    map["aciklama"] = super.aciklama.toString();
    map["zaman"] = super.zaman.toString();
    map["harcanan_kalori"] = super.harcanan_kalori.toString();
    map["set_sayisi"] = super.set_sayisi.toString();
    map["tekrar_sayisi"] = super.tekrar_sayisi.toString();
    map["hareket_ismi"] = this.hareket_ismi.toString();

    return map;
  }

  AntrenmanGogus.fromObject(dynamic o) {
    super.isim = o["isim"].toString();
    super.aciklama = ["aciklama"].toString();
    super.zaman = ["zaman"] as int?;
    super.tekrar_sayisi = ["tekrar_sayisi"] as int?;
    super.set_sayisi = ["set_sayisi"] as int?;
    super.harcanan_kalori = ["harcanan_kalori"] as int?;
    this.hareket_ismi = ["hareket_ismi"].toString();
  }
}
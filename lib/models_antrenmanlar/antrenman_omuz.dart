import 'package:arikan06/models_antrenmanlar/antrenman.dart';

class AntrenmanOmuz extends Antrenman{
  String? hareket_ismi;
  List<String> hareketler = [
    "Barbell Overhead Press Hareketi",
    "Arnold Press Hareketi",
    "Up-right Row – Çeneye Çekiş Hareketi",
    "Lateral Raise – Yana Açış Hareketi",
    "Front Raise",
    "Yana Açış Hareketi",
    "Yana Açış Hareketi Yapılışı",
    "Arnold Press",
    "Arnold Press",

  ];

  AntenmanBacak() {}

  AntrenmanOmuz(
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

  AntrenmanOmuz.fromObject(dynamic o) {
    super.isim = o["isim"].toString();
    super.aciklama = ["aciklama"].toString();
    super.zaman = ["zaman"] as int?;
    super.tekrar_sayisi = ["tekrar_sayisi"] as int?;
    super.set_sayisi = ["set_sayisi"] as int?;
    super.harcanan_kalori = ["harcanan_kalori"] as int?;
    this.hareket_ismi = ["hareket_ismi"].toString();
  }
}
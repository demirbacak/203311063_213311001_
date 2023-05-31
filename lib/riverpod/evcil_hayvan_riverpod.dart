import 'package:flutter/cupertino.dart';
import '../kategori_sayfalari/evcil_hayvan_model.dart';

class EvcilHayvanRiverpod extends ChangeNotifier {

  late List<EvcilHayvanModel> evcilHayvanlar = <EvcilHayvanModel>[
    kedi_tarcin,
    kedi_azman,
    kus_bulut,
    kedi_boncuk,
    kopek_uyusuk,
    kopek_neseli,
    kedi_mavis,
    kedi_pamuk,
    diger_merakli,
    kedi_tirmik,
    kopek_kar,
    surungen_uzun_kuyruk,
    kopek_dertli,
    kopek_benekli,
    kopek_beyaz_dis,
    kus_renkli,


  ];
  List<EvcilHayvanModel> favoriler = [];
  late List<EvcilHayvanModel> kopekler = [kopek_kar, kopek_uyusuk,kopek_beyaz_dis, kopek_benekli, kopek_dertli, kopek_neseli];
  late List<EvcilHayvanModel> kediler = [kedi_tirmik, kedi_pamuk, kedi_mavis, kedi_boncuk, kedi_azman, kedi_tarcin];
  late List<EvcilHayvanModel> kuslar = [kus_bulut, kus_renkli];
  late List<EvcilHayvanModel> baliklar = [];
  late List<EvcilHayvanModel> surungenler = [surungen_uzun_kuyruk];
  late List<EvcilHayvanModel> digerHayvanlar = [diger_merakli];




  EvcilHayvanModel kedi_tarcin = EvcilHayvanModel(isim: "Tarçın",
      turu: "Kedi",
      yasi: "1 yaşında",
      konum: "Trabzon",
      cinsiyet: "Erkek",
      resim: "assets/images/tarcin.jpg");
  EvcilHayvanModel kedi_azman = EvcilHayvanModel(isim: "Azman",
      turu: "Kedi",
      yasi: "1.5 yaşında",
      konum: "Karesi/Balıkesir",
      cinsiyet: "Erkek",
      resim: "assets/images/azman.jpg");
  EvcilHayvanModel kedi_boncuk = EvcilHayvanModel(isim: "Boncuk",
      turu: "Kedi",
      yasi: "3 aylık",
      konum: "Meram/Konya",
      cinsiyet: "Dişi",
      resim: "assets/images/boncuk.jpg");
  EvcilHayvanModel kedi_mavis = EvcilHayvanModel(isim: "Maviş",
      turu: "Kedi",
      yasi: "2 yaşında",
      konum: "Kadıköy/İstanbul",
      cinsiyet: "Dişi",
      resim: "assets/images/mavis.jpg");
  EvcilHayvanModel kedi_pamuk = EvcilHayvanModel(isim: "Pamuk",
      turu: "Kedi",
      yasi: "3 aylık",
      konum: "Meram/Konya",
      cinsiyet: "Erkek",
      resim: "assets/images/pamuk.jpg");
  EvcilHayvanModel kedi_tirmik = EvcilHayvanModel(isim: "Tırmık",
      turu: "Kedi",
      yasi: "2 yaşında",
      konum: "Beylikdüzü/İstanbul",
      cinsiyet: "Dişi",
      resim: "assets/images/tirmik.jpg");
  EvcilHayvanModel kopek_kar = EvcilHayvanModel(isim: "Kar",
      turu: "Kopek",
      yasi: "2 yaşında",
      konum: "Kadıköy/İstanbul",
      cinsiyet: "Dişi",
      resim: "assets/images/kar.jpg");
  EvcilHayvanModel kopek_uyusuk = EvcilHayvanModel(isim: "Uyuşuk",
      turu: "Kopek",
      yasi: "6 aylık",
      konum: "Bandırma/Balıkesir",
      cinsiyet: "Erkek",
      resim: "assets/images/uyusuk.jpg");
  EvcilHayvanModel kopek_beyaz_dis = EvcilHayvanModel(isim: "Beyaz Diş", turu: "Köpek", yasi: "2 yaşında", konum: "Akçaabat/Trabzon", cinsiyet: "Erkek", resim:"assets/images/beyaz_dis.jpg" );
  EvcilHayvanModel kopek_benekli = EvcilHayvanModel(isim: "Benekli", turu: "Köpek", yasi: "2,5 yaşında", konum: "Şahinbey/Gaziantep", cinsiyet: "Erkek", resim:"assets/images/benekli.jpg" );
  EvcilHayvanModel kopek_dertli = EvcilHayvanModel(isim: "Dertli", turu: "Köpek", yasi: "8 aylık", konum: "Simav/Kütahya", cinsiyet: "Erkek", resim:"assets/images/dertli.jpg" );
  EvcilHayvanModel kopek_neseli = EvcilHayvanModel(isim: "Neşeli", turu: "Köpek", yasi: "1 yaşında", konum: "Sarıyer/İstanbul", cinsiyet: "Erkek", resim:"assets/images/neseli.jpg" );
  EvcilHayvanModel kus_bulut = EvcilHayvanModel(isim: "Bulut", turu: "Papağan", yasi: "1 yaşında", konum: "Alanya/Antalya", cinsiyet: "Dişi", resim:"assets/images/bulut.jpg" );
  EvcilHayvanModel kus_renkli = EvcilHayvanModel(isim: "Renkli", turu: "Papağan", yasi: "2 yaşında", konum: "Konak/İzmir", cinsiyet: "Dişi", resim:"assets/images/renkli.jpg" );
  EvcilHayvanModel surungen_uzun_kuyruk = EvcilHayvanModel(isim: "Uzun Kuyruk", turu: "İguana", yasi: "1,5 yaşında", konum: "Karşıyaka/İzmir", cinsiyet: "Erkek", resim:"assets/images/uzun_kuyruk.jpg" );
  EvcilHayvanModel diger_merakli = EvcilHayvanModel(isim: "Meraklı", turu: "Eşek", yasi: "7 aylık", konum: "Akşehir/Konya", cinsiyet: "Dişi", resim:"assets/images/merakli.jpg" );


  void favoriEkleCikar(EvcilHayvanModel model) {
    if (model.favoriMi) {
      model.favoriMi = false;
      favoriler.remove(model);
      notifyListeners();
    } else {
      model.favoriMi = true;
      favoriler.add(model);
      notifyListeners();
    }

    /*void turSayfasinaEkle(EvcilHayvanModel model) {
      if (model.turu == "Kopek") {
        kopekler.add(model);
      }
    }*/
  }
}
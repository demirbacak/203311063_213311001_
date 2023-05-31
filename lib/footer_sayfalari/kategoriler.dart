import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/balik.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/diger_hayvan.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/kedi.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/kopek.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/kus.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/surungen.dart';
import '../my_widgets/my_widgets.dart';

class Kategoriler extends ConsumerWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20,
                color: color2,
                fontWeight: FontWeight.bold
            )
        ),
      ),*/
      body: ListView(
        children: [


          buildKategori(myicon: FontAwesomeIcons.cat, kategoriAdi: "KEDİ", mywidget: const Kedi(), context: context),
          buildKategori(myicon: FontAwesomeIcons.dog, kategoriAdi: "KÖPEK", mywidget: const Kopek(), context: context),
          buildKategori(myicon: FontAwesomeIcons.crow, kategoriAdi: "KUŞ", mywidget: const Kus(), context: context),
          buildKategori(myicon: FontAwesomeIcons.fish, kategoriAdi: "BALIK", mywidget: const Balik(), context: context),
          buildKategori(myicon: FontAwesomeIcons.staffSnake, kategoriAdi: "SÜRÜNGEN", mywidget: const Surungen(), context: context),
          buildKategori(myicon: FontAwesomeIcons.paw, kategoriAdi: "DİĞER", mywidget: const DigerHayvan(), context: context),

        ],

      ),
     /* persistentFooterButtons: [
        buildNavigationIcons(myicon: FontAwesomeIcons.bars, mytext:"kategoriler" , mywidget: const Kategoriler(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.heart, mytext:"favorilerim" , mywidget: const Favorilerim(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.house, mytext:"ana sayfa" , mywidget: const AnaSayfa(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.user, mytext:"profilim" , mywidget: const Profilim(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.circleQuestion, mytext:"hakkında" , mywidget: const Hakkinda(), context: context),
      ],*/
    );
  }
}


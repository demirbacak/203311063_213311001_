import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../evcil_hayvan/evcil_hayvan_detay.dart';
import '../evcil_hayvan/evcil_hayvan_widget.dart';
import '../main.dart';
import '../riverpod/riverpod_management.dart';

class Kedi extends ConsumerWidget {
  const Kedi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var watch = ref.watch(evcilHayvanRiverpod);
    var read = ref.read(evcilHayvanRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20,
                color: color2,
                fontWeight: FontWeight.bold
            )
        ),
      ),
      body: ListView.builder(
        itemCount: read.kediler.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return EvcilHayvanDetay(model: watch.kediler[index]);
                  }));
            },
            child: (
                EvcilHayvanWidget(
                  model: watch.kediler[index],
                  favoriEkleCikar: () =>
                      read.favoriEkleCikar(watch.kediler[index]),
                )
            ),
          );
        },
      ),
    );
  }
}


/*class Kedi extends StatefulWidget {
  const Kedi({Key? key}) : super(key: key);



  @override
  State<Kedi> createState() => _KediState();
}

class _KediState extends State<Kedi> {

  EvcilHayvanModel kedi_tarcin= EvcilHayvanModel(isim: "Tarçın", turu: "Van Kedisi", yasi: "1 yaşında", konum: "Trabzon", cinsiyet: "Erkek", resim: "assets/images/tarcin.jpg");
  EvcilHayvanModel kedi_azman= EvcilHayvanModel(isim: "Azman", turu: "Tekir", yasi: "1.5 yaşında", konum: "Karesi/Balıkesir", cinsiyet: "Erkek", resim: "assets/images/azman.jpg");
  EvcilHayvanModel kedi_boncuk= EvcilHayvanModel(isim: "Boncuk", turu: "Ankara Kedisi", yasi: "3 aylık", konum: "Meram/Konya", cinsiyet: "Dişi", resim: "assets/images/boncuk.jpg");
  EvcilHayvanModel kedi_mavis= EvcilHayvanModel(isim: "Maviş", turu: "Van Kedisi", yasi: "2 yaşında", konum: "Kadıköy/İstanbul", cinsiyet: "Dişi", resim: "assets/images/mavis.jpg");
  EvcilHayvanModel kedi_pamuk= EvcilHayvanModel(isim: "Pamuk", turu: "Ankara Kedisi", yasi: "3 aylık", konum: "Meram/Konya", cinsiyet: "Erkek", resim: "assets/images/pamuk.jpg");
  EvcilHayvanModel kedi_tirmik= EvcilHayvanModel(isim: "Tırmık", turu: "Van Kedisi", yasi: "2 yaşında", konum: "Beylikdüzü/İstanbul", cinsiyet: "Dişi", resim: "assets/images/tirmik.jpg");


  late List<EvcilHayvanModel> kediler = <EvcilHayvanModel>[kedi_tarcin, kedi_azman, kedi_boncuk, kedi_mavis, kedi_pamuk, kedi_tirmik];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
        style: TextStyle(
        fontSize: 20,
        color: color2,
        fontWeight: FontWeight.bold
    )
    ),
    ),
    body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: kediler.length,
          itemBuilder: (BuildContext context, int index) {
            return buildEvcilHayvan(yeniEvcilHayvan: kediler[index]);
          }
      ),



      /*Column(
        children:[
        buildEvcilHayvan(yeniEvcilHayvan: kedi_tarcin),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_azman),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_boncuk),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_mavis),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_pamuk),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_tirmik),]
      ),*/

     /* persistentFooterButtons: [
        buildNavigationIcons(myicon: FontAwesomeIcons.bars, mytext:"kategoriler" , mywidget: const Kategoriler(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.heart, mytext:"favorilerim" , mywidget: Favorilerim(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.house, mytext:"ana sayfa" , mywidget: const AnaSayfa(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.user, mytext:"profilim" , mywidget: const Profilim(), context: context),
        buildNavigationIcons(myicon: FontAwesomeIcons.circleQuestion, mytext:"hakkında" , mywidget: const Hakkinda(), context: context),
      ],
*/
      /*FooterView(
      children: [
        buildEvcilHayvan(yeniEvcilHayvan: kedi_tarcin),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_azman),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_boncuk),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_mavis),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_pamuk),
        buildEvcilHayvan(yeniEvcilHayvan: kedi_tirmik),

      ],

      footer: Footer(
        child:


        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavigationIcons(myicon: FontAwesomeIcons.bars, mytext:"kategoriler" , mywidget: Kategoriler(), context: context),
            buildNavigationIcons(myicon: FontAwesomeIcons.heart, mytext:"favorilerim" , mywidget: Favorilerim(), context: context),
            buildNavigationIcons(myicon: FontAwesomeIcons.house, mytext:"ana sayfa" , mywidget: AnaSayfa(), context: context),
            buildNavigationIcons(myicon: FontAwesomeIcons.user, mytext:"profilim" , mywidget: Profilim(), context: context),
            buildNavigationIcons(myicon: FontAwesomeIcons.circleQuestion, mytext:"hakkında" , mywidget: Hakkinda(), context: context),
          ],
        ),
      ),
    ),*/
    );
  }
}
*/

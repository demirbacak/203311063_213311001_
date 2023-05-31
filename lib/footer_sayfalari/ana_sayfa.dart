import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeni_can_dostum/evcil_hayvan/evcil_hayvan_detay.dart';
import 'package:yeni_can_dostum/evcil_hayvan/evcil_hayvan_widget.dart';
import '../riverpod/riverpod_management.dart';

class AnaSayfa extends ConsumerWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   var watch = ref.watch(evcilHayvanRiverpod);
   var read = ref.read(evcilHayvanRiverpod);


    return Scaffold(

      body: ListView.builder(
        itemCount: read.evcilHayvanlar.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return EvcilHayvanDetay(model: watch.evcilHayvanlar[index]);
                  }));
            },
            child: (
            EvcilHayvanWidget(
              model: watch.evcilHayvanlar[index],
              favoriEkleCikar: () => read.favoriEkleCikar(watch.evcilHayvanlar[index]),
            )
            ),
          );
        },
      )
    );
  }
}

/*class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
        style: TextStyle(
          fontSize: 20,
          color: color2,
          fontWeight: FontWeight.bold
        )
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const Text("burada tüm hayvanlar listelenecek")
          ],
        ),
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
}*/




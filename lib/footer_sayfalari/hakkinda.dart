import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Hakkinda extends ConsumerWidget {
  const Hakkinda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Bu uygulama Mühendislik Tasarımı dersi kapsamında Salih Kurt ve Mustafa Demirbacak tarafından geliştirilmiştir.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Selçuk Üniversitesi",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )
                    ),

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Teknoloji Fakültesi",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )
                    ),

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Bilgisayar Mühendisliği",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )
                    ),

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("2022-2023 Bahar Dönemi",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        )
                    ),

                  ),
                ],
              ),
            ],
          )
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

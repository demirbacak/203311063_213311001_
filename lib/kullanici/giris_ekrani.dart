import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yeni_can_dostum/tasiyici_sayfalar/base_scaffold.dart';
import 'package:yeni_can_dostum/kullanici/kayit_ekrani.dart';
import '../tasiyici_sayfalar/main.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  /* String isim = "";
  String soyisim = "";
  var adSoyad = [];*/
  //String mailAdresi = "";
  //String sifre = "";

  TextEditingController temail = TextEditingController();
  TextEditingController tsifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //bool girisizni = true;

    /*void girisKontrol() {
      if ((isim.length>=3) && (soyisim.length>=2)) {
        girisizni = true;
        adSoyad.add(isim);
        adSoyad.add(soyisim);
      } else {
        girisizni = false;
        //Navigator.pushNamed(context, '/hata');
      }
    }*/
    girisyap() {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: temail.text, password: tsifre.text)
          .then((kullanici) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const BaseScaffold()),
                (Route<dynamic> route) => false);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          const Text(
            "Mail adresi :",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
             /* onChanged: (text) {
                mailAdresi = text;
              },*/
              controller: temail,
              decoration: const InputDecoration(hintText: "example@gmail.com"),
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
            ),
          ),
          const Text(
            "Sifre :",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
             /* onChanged: (text) {
                sifre = text;
              },*/
              controller: tsifre,
              decoration: const InputDecoration(hintText: "Şifrenizi giriniz"),
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: color1),
              onPressed: girisyap,
              /*girisizni
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BaseScaffold(), /*settings: RouteSettings(arguments:adSoyad )*/
                        ),
                      );
                    }
                  : null,*/
              child: Text(
                "GİRİŞ",
                style: TextStyle(
                  color: color2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: color1),
              onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const KayitEkrani(),
                        ),
                      );
                    },

              child: Text(
                "Kaydol",
                style: TextStyle(
                  color: color2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

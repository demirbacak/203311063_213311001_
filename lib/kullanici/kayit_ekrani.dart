import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yeni_can_dostum/kullanici/giris_ekrani.dart';
import '../tasiyici_sayfalar/main.dart';

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({Key? key}) : super(key: key);

  @override
  State<KayitEkrani> createState() => _KayitEkraniState();
}



class _KayitEkraniState extends State<KayitEkrani> {

  TextEditingController tisim = TextEditingController();
  TextEditingController tsoyisim = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tsifre = TextEditingController();
  TextEditingController tdogumtarihi = TextEditingController();
  TextEditingController tsehir = TextEditingController();

  Future<void> kayitOl() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: temail.text, password: tsifre.text)
        .then((kullanici) {
      FirebaseFirestore.instance
          .collection("kullanicilar")
          .doc(temail.text)
          .set({
        "isim": tisim.text,
        "soyisim": tsoyisim.text,
        "email": temail.text,
        "sifre": tsifre.text,
        "dogumtarihi": tdogumtarihi.text,
        "sehir": tsehir.text
      });
    }).whenComplete((){Navigator.push(context, MaterialPageRoute(builder:(context)=>const GirisEkrani(), ),);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "İsim : ",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: tisim,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Text("Soyisim : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: tsoyisim,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Text("e-mail : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: temail,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const Text("sifre : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: tsifre,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Text("Doğum Tarihi : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: tdogumtarihi,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Text("Şehir : "),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TextFormField(
                        controller: tsehir,
                        decoration: const InputDecoration(),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  ElevatedButton(
                      onPressed: kayitOl,
                      style: ElevatedButton.styleFrom(backgroundColor: color1),
                      child: Text(
                        "Kaydol",
                        style: TextStyle(
                          color: color2,
                        ),
                      )),

                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

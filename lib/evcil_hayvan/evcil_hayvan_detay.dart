import 'package:flutter/material.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/evcil_hayvan_model.dart';
import 'package:yeni_can_dostum/evcil_hayvan/mesaj_ekrani.dart';

import '../main.dart';

class EvcilHayvanDetay extends StatelessWidget {
  // EvcilHayvanWidget({Key? key}) : super(key: key);

  EvcilHayvanModel model;

  // Function favoriEkleCikar;

  EvcilHayvanDetay({super.key,
    required this.model,
    // required this.favoriEkleCikar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text("Yeni Can Dostum",
            style: TextStyle(
                fontSize: 20, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 300,
                          width: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage(model.resim),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  model.isim,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: color2,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  model.yasi,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: color1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  model.cinsiyet,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: color1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  model.konum,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: color1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: color1),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const MesajEkarni();
                        }));
                  },
                  child: Text(
                    ("Bir mesaj gönder"),
                    style: TextStyle(
                      color: color2,
                      fontSize: 24,
                    ),
                  ),
                ),
                /*Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: " Bir mesaj bırakın"),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                  const AlertDialog(
                                    content: Text(
                                      "Mesajınız iletildi",
                                      style: (TextStyle(
                                        fontStyle: FontStyle.italic,
                                      )),
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: color1),
                              child: Text(
                                "Gönder",
                                style: TextStyle(
                                  color: color2,
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
          /*  Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
             /* child: GestureDetector(
                onTap: () => favoriEkleCikar(),*/
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    model.favoriMi
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: model.favoriMi ? Colors.red : Colors.black,
                  ),
                ),
              ),
            ),*/
        ],
      ),
    );
  }
}

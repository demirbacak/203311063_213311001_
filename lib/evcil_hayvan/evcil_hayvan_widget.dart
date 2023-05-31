import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yeni_can_dostum/kategori_sayfalari/evcil_hayvan_model.dart';

class EvcilHayvanWidget extends StatelessWidget {
 // EvcilHayvanWidget({Key? key}) : super(key: key);

  EvcilHayvanModel model;
  Function favoriEkleCikar;

  EvcilHayvanWidget({super.key,
    required this.model,
    required this.favoriEkleCikar,
});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(image:AssetImage(model.resim),
                ),
    ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          model.isim,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        model.yasi,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        model.cinsiyet,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        model.konum,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => favoriEkleCikar(),
              child: Container(
                padding: const EdgeInsets.all(3),
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
          ),
        ),
      ],
    );
  }
}

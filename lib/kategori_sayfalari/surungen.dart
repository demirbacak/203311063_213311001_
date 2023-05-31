import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../evcil_hayvan/evcil_hayvan_detay.dart';
import '../evcil_hayvan/evcil_hayvan_widget.dart';
import '../main.dart';
import '../riverpod/riverpod_management.dart';

class Surungen extends ConsumerWidget {
  const Surungen({super.key});

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
        itemCount: read.surungenler.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return EvcilHayvanDetay(model: watch.surungenler[index]);
                  }));
            },
            child: (
                EvcilHayvanWidget(
                  model: watch.surungenler[index],
                  favoriEkleCikar: () =>
                      read.favoriEkleCikar(watch.surungenler[index]),
                )
            ),
          );
        },
      ),
    );
  }
}
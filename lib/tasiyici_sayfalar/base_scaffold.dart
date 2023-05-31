import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeni_can_dostum/tasiyici_sayfalar/bottom_nav_bar.dart';
import 'package:yeni_can_dostum/kullanici/giris_ekrani.dart';
import 'package:yeni_can_dostum/riverpod/riverpod_management.dart';

import 'main.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: //appbarBuild(watch),
          AppBar(
        backgroundColor: color1,
        title: Text(watch.appbarTitle()),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) => {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const GirisEkrani()),
                        (Route<dynamic> route) => false)
                  });
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: watch.body(),
    );
  }

/*CupertinoNavigationBar appbarBuild(BottomNavBarRiverpod watch) {
    return CupertinoNavigationBar(
      middle: Text(watch.appbarTitle()),
    );
  }*/
}

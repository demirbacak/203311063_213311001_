import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeni_can_dostum/footer_sayfalari/ana_sayfa.dart';
import 'package:yeni_can_dostum/footer_sayfalari/favorilerim.dart';
import 'package:yeni_can_dostum/footer_sayfalari/hakkinda.dart';
import 'package:yeni_can_dostum/footer_sayfalari/kategoriler.dart';
import 'package:yeni_can_dostum/footer_sayfalari/profilim.dart';
import 'package:yeni_can_dostum/main.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bars, color: color1,), label: "Kategoriler"),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart, color: color1,), label: "Favorilerim"),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house, color: color1,), label: "Anasayfa"),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user, color: color1,), label: "Profilim"),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.circleQuestion,color: color1,), label: "Hakkında"),

  ];
  int currentIndex = 2;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appbarTitle() {
    switch (currentIndex) {
      case 0:
        return "Kategoriler";
      case 1:
        return "Favorilerim";
      case 2:
        return "Anasayfa";
      case 3:
        return "Profilim";
      case 4:
        return "Hakkında";
      default:
        return "Anasayfa";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const Kategoriler();
      case 1:
        return const Favorilerim();
      case 2:
        return const AnaSayfa();
      case 3:
        return const Profilim();
      case 4:
        return const Hakkinda();
      default:
        return const AnaSayfa();
    }
  }
}
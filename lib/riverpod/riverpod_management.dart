import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bottom_navbar_riverpod.dart';
import 'evcil_hayvan_riverpod.dart';

final bottomNavBarRiverpod = ChangeNotifierProvider((_) => BottomNavBarRiverpod());

final evcilHayvanRiverpod = ChangeNotifierProvider((_) => EvcilHayvanRiverpod());


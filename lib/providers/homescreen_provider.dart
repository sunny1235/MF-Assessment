

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider<HomeScreenProvider>((ref) {
  return HomeScreenProvider();
});

class HomeScreenProvider extends ChangeNotifier{

  int _dateType = 0;
  int get dateType => _dateType;

  void setDateType(int type){
    _dateType = type;
    notifyListeners();
  }
}
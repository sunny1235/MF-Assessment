import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mf_assessment/models/multi_model.dart';
import 'package:mf_assessment/statics/dummy_data.dart';

final calndarProvider = ChangeNotifierProvider((ref) => CalendarProvider());

class CalendarProvider extends ChangeNotifier {
  List<DateTime?> _initialDate = [
    DateTime.now(),
  ];

  List<DateTime?> get initialDate => _initialDate;

  void setInitialDate(List<DateTime?> dates) {
    _initialDate = dates;
    notifyListeners();
  }

  void resetInitialDate(){
    _initialDate.clear();
    _initialDate = [DateTime.now()];
    notifyListeners();
  }

  int _dateRangValue = 0;
  int get dateRangeValue => _dateRangValue;

  void setDateRangeValue() {
    _dateRangValue =
        DateTime.parse(DateFormat('yyyy-MM-dd').format(_initialDate.last!))
            .difference(DateTime.parse(
                DateFormat('yyyy-MM-dd').format(_initialDate.first!)))
            .inDays;
  }

  DateTime _datePicked = DateTime.now();

  DateTime get datePicked => _datePicked;

  void setDatePicked() {
    _datePicked = _initialDate.first!;
  }


  int _tabBarSelectedIndex = 0;
  int get tabBarSelectedIndex => _tabBarSelectedIndex;

  void setTabBarIndex(int val){
    _tabBarSelectedIndex = val;
    notifyListeners();
  }


  int _hrdTotalValue = 0;
  int get hrdTotalValue => _hrdTotalValue;

  int _techTotalValue = 0;
  int get techTotalValue => _techTotalValue;

  int _followUpTotalValue = 0;
  int get followUpTotalValue => _followUpTotalValue;

  int _allTotalValue = 0;
  int get allTotalValue => _allTotalValue;

  void calculateTotal() {
    List<MultipleDateDataModel> selectedDataList =
        multiDateData.take(_dateRangValue + 1).toList();
    for (var item in selectedDataList) {
        _hrdTotalValue += item.hrd;
        _techTotalValue += item.tech;
        _followUpTotalValue += item.followup;
        _allTotalValue += item.total;
    }
  }
}

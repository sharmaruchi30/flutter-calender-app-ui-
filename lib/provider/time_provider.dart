import 'package:flutter/material.dart';
List<String> months = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"];


class TimeProvider with ChangeNotifier{
  String _time = "${DateTime.now().hour}.${DateTime.now().minute}";
  String _month = months[DateTime.now().month-1];

  String get time => _time;
  String get month => _month;
  void setTime(){
    _time = "${DateTime.now().hour}.${DateTime.now().minute}";
    notifyListeners();
  }

  void setMonth(){
   _month = months[DateTime.now().month];
   notifyListeners();
  }
}



import 'package:flutter/material.dart';


class SelectedTimeChangeProvider with ChangeNotifier{
  Map _tasks = new Map();
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;
  Map get tasks => _tasks;


  void setSelectedDate(DateTime selectedDate){
    _selectedDate = selectedDate;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class CalcPageProvider with ChangeNotifier{
  String str = "";
  void numberPressed(String number){
    str += number;
    notifyListeners();
  }
}
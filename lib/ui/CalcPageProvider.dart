import 'package:flutter/cupertino.dart';
import 'package:op_tracker/models/calculator.dart';

class CalcPageProvider with ChangeNotifier{
  String str = "";
  String ans = "";
  Calculator _calculator = Calculator();
  void buttonPressed(String button){
    int t  = int.tryParse(button);
    if(t != null){
      str += button;
    }
    else{
      switch (button){
        case "%": break;
        case "CE":
          str = "";
          break;
        case "C":
          str = "";
          break;
        case "⌫":
          str = str.substring(0, str.length - 1);
          break;
        case "1/x":break;
        case "^" :break;
        case "⌫": break;
        case "√":break;
        case "/" :break;
        case "X": break;
        case "-":break;
        case "+" :break;
        case "." :
          if(!str.endsWith(".")&(str.isNotEmpty)){
            str+=".";
          }
          break;
        case "=": break;
        case "listToCode":
          ans = _calculator.listToCode(str);
          break;
        case "codeToList":
          ans = _calculator.codeToList(str);
          break;
        case "codeToOpers":
          break;
      }
    }
    notifyListeners();
  }
}
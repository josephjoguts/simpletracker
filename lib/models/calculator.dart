

import 'dart:math';

import 'package:op_tracker/resources/constants.dart';

class Calculator{

  String listToCode(String str){
    if(str.isEmpty || !str.contains('.')) return "nothing to convert";
    List<String> numbers = str.split(".");
    BigInt ans = BigInt.one;
    for(int i = 0; i < numbers.length; i++){
      int l = int.tryParse(numbers[i]);
      if(l == null) return 'not a number';
      ans *= BigInt.from(pow(primes[i], l+1));
    }
    return ans.toString();
  }
  String codeToList(String str){
    String ans = "[";
    BigInt number = BigInt.tryParse(str);
    if(number == null) return "can't convert";
    int index = 0;
    while(number > BigInt.one){
      BigInt prime = BigInt.from(primes[index]);
      int counter = 0;
      while(number % prime == BigInt.zero){
        number = BigInt.from(number/prime);
        print(prime);
        counter++;
      }
      ans += "${counter - 1}, ";
      index++;
    }
    ans =  ans.substring(0, ans.length-2) + "]";
    return ans;
  }
  List<String>codeToOpers(String str){
    return [];
  }
}
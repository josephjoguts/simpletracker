

import '../calculator.dart';
import 'decoder_delegate.dart';

class CodeToListAndOperation extends DecoderDelegate {
  Calculator _calc = Calculator();
  @override
  String calc(String source) {
    var bigInt = BigInt.tryParse(source) ?? BigInt.one;
    var code = _calc.decode(bigInt);
  //  var operation = RegOpeartion.fromList(code);
   // return "$code\n$operation";
    return "";
  }
}

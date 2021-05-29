

import '../calculator.dart';
import 'decoder_delegate.dart';

class CodeToListDecoder implements DecoderDelegate {
  Calculator _calc = Calculator();
  @override
  String calc(String source) {
    var bigInt = BigInt.tryParse(source) ?? BigInt.one;
    var code = _calc.decode(bigInt);
    return "$code\n";
  }
}

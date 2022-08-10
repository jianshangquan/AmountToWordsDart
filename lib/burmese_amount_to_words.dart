import 'package:amount_to_words_dart/amount_to_words_dart.dart';
import 'package:big_decimal/big_decimal.dart';

class BurmeseAmountToWord extends AmountToWord {
  static final List<String> unit = ["ခု", "ဆယ်", "ရာ", "ထောင်", "သောင်း", "သိန်း", "သန်း", "ကုဍ"];
  static final List<String> numbers = ["၁", "၂", "၃", "၄", "၅", "၆", "၇", "၈", "၉", "၀"];
  static final List<String> words = ["တစ်", "နှစ်", "သုံး", "လေး", "ငါး", "ခြှောက်", "ခုနှစ်", "ရှစ်", "ကိုး", "သုံည"];
  static final BigDecimal maxConvertableAmt = BigDecimal.fromBigInt(BigInt.from(10000000000000));

  @override
  String convert() {
    if (checkValidAmount()) throw "Convert burmese amount must be lower than $maxConvertableAmt";
    String amtString = amount.toString();
    String firstTheinAmt = amtString.length > 5 ? amtString.substring(0, amtString.length - 5) : "";
    String lastTheinAmt = amtString.substring(amtString.length < 6 ? 0 : amtString.length - 6);
    String result = "";

    result = convertThein(lastTheinAmt);
    if (firstTheinAmt.isNotEmpty) {
      result = convertThein(firstTheinAmt) + (result.isEmpty ? "သိန်း" : "") + result;
    }
    result =
        "$result${(lastTheinAmt[lastTheinAmt.length - 1] != '0') ? lastTheinAmt[lastTheinAmt.length - 1] : ""}ကျပ်";

    return result;
  }

  @override
  String convertInLetter() {
    String result = convert();
    for (int i = 0; i < 10; i++) {
      result = result.replaceAll((i + 1).toString(), words[i]);
    }
    return result;
  }

  String convertThein(String theinAmt) {
    String result = "";
    for (int i = 0; i < theinAmt.length - 1; i++) {
      if ('0' != theinAmt[i]) {
        result = result + theinAmt[i] + unit[theinAmt.length - i - 1];
        if (i == theinAmt.length - 2 && theinAmt[i + 1] != '0') {
          result = result + "့";
        }
      }
    }
    return result;
  }

  @override
  bool checkValidAmount() {
    int cmp = amount.compareTo(maxConvertableAmt);
    return cmp == 1 || cmp == 0;
  }
}

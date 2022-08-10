import 'package:big_decimal/big_decimal.dart';

import 'burmese_amount_to_words.dart';
import 'chinese_amount_to_words.dart';
import 'english_amount_to_words.dart';

enum AmountConversion { burmese, chinese, english }

abstract class AmountToWord {
  late BigDecimal amount;

  static AmountToWord? getConverter(AmountConversion convertion) {
    switch (convertion) {
      case AmountConversion.burmese:
        {
          return BurmeseAmountToWord();
        }
      case AmountConversion.chinese:
        {
          return ChineseAmountToWord();
        }
      case AmountConversion.english:
        {
          return EnglishAmountToWord();
        }
      default:
        {
          return null;
        }
    }
  }

  static String? convertTo(dynamic value, AmountConversion conversion) {
    if (value is double) {
      return getConverter(conversion)?.setAmountFromDouble(value as double).convertInLetter();
    }
    if (value is int) {
      return getConverter(conversion)?.setAmountFromInt(value as int).convertInLetter();
    }
    if (value is BigDecimal) {
      return getConverter(conversion)?.setAmountFromBigDecimal(value as BigDecimal).convertInLetter();
    }
  }

  AmountToWord setAmountFromInt(int amt) {
    amount = BigDecimal.parse(amt.toString());
    return this;
  }

  AmountToWord setAmountFromDouble(double amt) {
    amount = BigDecimal.parse(amt.toString());
    return this;
  }

  AmountToWord setAmountFromBigDecimal(BigDecimal amt) {
    amount = amt;
    return this;
  }

  String convert();
  String convertInLetter();
  bool checkValidAmount();
}

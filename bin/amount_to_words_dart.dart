import 'package:amount_to_words_dart/amount_to_words_dart.dart';

void main(List<String> arguments) {
  final output = AmountToWord.convertTo(10000000000000, AmountConversion.burmese);
  print("output $output");
  // output -> တစ်ထောင်နှစ်ရာသုံးဆယ့်လေးသိန်းငါးသောင်းခြှောက်ထောင်ခုနှစ်ရာရှစ်ဆယ့်ကိုးကျပ်
}

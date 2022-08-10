# Amount to words

Convert amount in letter. 
> Note : Currently it support only burmese

```dart
    final output = AmountToWord.convertTo(123456789, AmountConversion.burmese);
    // output -> တစ်ထောင်နှစ်ရာသုံးဆယ့်လေးသိန်းငါးသောင်းခြှောက်ထောင်ခုနှစ်ရာရှစ်ဆယ့်ကိုးကျပ်
```

#### Max convertable amount in different language
| Language | Max convertable |
|--|--|
| Burmese | < 10000000000000 |


### Ported languages
Java: https://github.com/jianshangquan/AmountToWordsJava \
Javascript: https://github.com/jianshangquan/AmountToWordsJavascript \
Dart: https://github.com/jianshangquan/AmountToWordsDart \
Rust: https://github.com/jianshangquan/AmountToWordsRust

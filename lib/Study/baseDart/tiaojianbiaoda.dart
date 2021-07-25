main() {
  // int score = 70;
  // switch (score) {
  //   case 10:
  //     break;
  //   case 20:
  //     break;
  //   case 30:
  //     break;
  //   case 40:
  //     break;
  // }

  // var flag = true;
  // print(flag == true ? "我是true" : "我是false");

  //??运算符
  // var a;
  // var b = a ?? 10;
  // print(b);

  // var c = 20;
  // var d = c ?? 10;
  // print(d);

  //类型转换
  String str = "1231";
  var num = int.parse(str);
  print(num is int);

  int num2 = 121231;
  var str2 = num2.toString();
  print(str2 is String);

  try {
    String str3 = "sdfs";
    int num3 = int.parse(str3);
  } catch (e) {
    print(e);
  }

  // for (var i in items) {
  //   print(i);
  // }
  var i = 1;
  while (i <= 10) {
    print(i++);
  }
}

main() {
//   var name = 'renbin';
//   var num = 1234;
//   String names = "xiexiuxiu";

//   // print("你好 dart  $names  +  $name  +  $num");
//   // print(names);
//   // print(names);
//   // print(names);

// //常量
//   const pi = 3012312313;
//   final pi2 = 12312312;
//   // pi = 2131;   //常量不可修改
//   // pi2 = 21312312;
//   // print(pi);
//   // print(pi);

//   final a = new DateTime.now();
//   print(a);

//集合

  // var list = [1, 2, 3, "6"];
  // print(list);
  // print(list[2]);

  // var listString = <String>["1", "2"];
  // listString.add("4");
  // print(listString);

  //创建固定长度的集合,无法增加数据 无法修改长度
  // var list = List.filled(2, "12312");
  // print(list);
  // list[0] = "张三";
  // list[1] = "李四";
  // print(list);
  // print(list.length);

  //map数据
  // var person = {
  //   "name": "张三",
  //   "age": 18,
  //   "work": ["程序员", "外卖员"]
  // };
  // print(person);
  // print(person["name"]);
  // print(person["work"]);

  // var p = new Map();
  // p["name"] = "秀秀";
  // p["age"] = 28;
  // print(p);
  // print(p["age"]);

  //TODO 判断类型  is关键词

  var srt = "123123123";
  if (srt is String) {
    print(true);
  }
}

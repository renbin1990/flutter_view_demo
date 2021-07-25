main() {
  // var list = ["apple", "banana", "orange"];
  // print(list.length);
  // print(list.reversed); //集合反转,不改变数据结构
  // print(list);
  // print(list.isEmpty);
  // print(list.isNotEmpty);
  //
  // list.addAll(["111", "222"]);
  //
  // print(list.indexOf("111"));
  //
  // var str = list.join("-"); //list转换成字符串
  // print(str);
  // print(str is String);
  //map方法 修改集合中的数据
  var list = [11, 22, 33,3,5,6];
  // Iterable<int> mylist =  list.map((e){
  //   return e*2;
  // });
  //where 返回满足条件的值
  Iterable<int> mylist = list.where((element){
    return element>20;
  });
  //any 有一个满足条件  返回true
  // var mylist = list.any((element){
  //   return element>20;
  // });
  // //every 所有的满足条件  返回true
  // var mylists = list.every((element){
  //   return element>20;
  // });
  // list.forEach((value) => print(value));
  print(mylist.toList());
  // print(mylists);

}

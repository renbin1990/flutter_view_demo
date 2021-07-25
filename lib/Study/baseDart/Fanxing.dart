import 'dart:math';
/**
 * 泛型
 */
// T getData<T>(T data){
//   return data;
// }
//
// class MyList<T>{
//   List<T> list = [];
//   void add(T value){
//     list.add(value);
//   }
//   List<T> getList(){
//     return list;
//   }
// }
//
//
// main(){
//   print(getData("1231231"));
//   print(getData(12312));
//
//   MyList list = new MyList();
//   list.add("张三");
//   list.add(111);
//   print(list.getList());
//
//   MyList<int> list1 = new MyList();
//   list1.add(12312);
//   list1.add(12312);
//   print(list1.getList());
//
//   print(max(100, 200));
// }

void main() async{
  var result = textAsync();
  print(result);

  Web w = new Web('张三', 12, "男");
  w.printInfo();
  w.run();
}

textAsync() async{
  return "hello world";
}

class Person {
  String name;
  num age;
  Person(this.name, this.age);
  void printInfo() {
    print("${this.name}---${this.age}");
  }
  work(){
    print("${this.name}在工作...");
  }
}

//super关键词的使用  实例化自类给父类构造函数传参
class Web extends Person {
  late String sex;
  Web(String name, num age, String sex) : super(name, age) {
    this.sex = sex;
  }
  run() {
    print("${this.name}---${this.age}--${this.sex}");
    super.work();  //子类调用父类的方法
  }

  //覆写父类的方法
  @override       //可以写也可以不写  建议在覆写父类方法的时候加上
  void printInfo(){
    print("姓名：${this.name}---年龄：${this.age}");
  }
  @override
  work(){
    print("${this.name}的工作是写代码");
  }
}
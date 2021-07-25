main() {
  //
  // double aar = 123123.1231;
  // print(9 ~/ 2.5);

  //基础赋值运算 ??=  =

  // int a = 20;
  // a ??= 1
  // 0;
  // print(a);

  // var a = 10;
  // print(a += 20);
}

class Person {
  String name;
  num age;
  Person(this.name, this.age);
  void printInfo() {
    print("${this.name}---${this.age}");
  }
}

class Web extends Person {
  late String sex;
  Web(String name, num age, String sex) : super(name, age) {
    this.sex = sex;
  }
  run() {
    print("${this.name}---${this.age}--${this.sex}");
  }
}
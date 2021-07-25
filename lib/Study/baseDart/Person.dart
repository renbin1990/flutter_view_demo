class Person {
  late String _name; //前面加_表示私有
  late int _age;

  Person(String name, int age) {
    this._name = name;
    this._age = age;
  }

  Person.now() {
    print("我是命名构造函数");
  }

  Person.setInfo(String name, int age) {
    this._name = name;
    this._age = age;
  }

  void printInfo() {
    print("姓名：$_name---年龄：$_age");
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Person{_name: $_name, _age: $_age}';
  }

  void _run(){
    print('这是一个私有方法');
  }

  execRun(){
    this._run();  //类里面方法的相互调用
  }
}

main() {
  Person person = new Person("张三", 20);
  Person person1 = new Person.setInfo("李四", 25);
  person.printInfo();
  person1.printInfo();
  person.execRun();
  person.name = "王五";
  print(person.name);
  // Person? p2;
  //  p2!.printInfo();

  //类型转换as
  var p3;
  p3 = "";
  p3 = new Person("王五", 25);
  (p3 as Person).printInfo();

  //级联操作  ..
  Person p4 = new Person("老六", 23);
  p4
    ..name = "sdfsd"
    ..age = 12312
    ..printInfo();
}

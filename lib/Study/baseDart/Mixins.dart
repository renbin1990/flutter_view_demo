
//mixins  能实现类似多继承的功能，但不是多继承，使用with关键字

class A{
  void printA(){
    print("a");
  }
}

class B{
  void printB(){
    print("b");
  }
}
class D{
  void printD(){
    print("d");
  }
}


class C extends A with B {

}
class E with A , B ,D{

}


main(){
  C c = new C();
  c.printA();
  c.printB();

  E e = new E();
  e.printA();
  e.printB();
  e.printD();
}
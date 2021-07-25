// dynamic a;
// Object b;

import 'package:flutter/services.dart';

void main() {
  //声明一个变量，第一次赋值的时候确定其类型
  var a = "12312312";
  print(a);

  //而dynamic与Object相同之处在于,他们声明的变量可以在后期改变赋值类型。
  dynamic t;
  Object x;
  t = "hi world";
  x = 'Hello Object';
//下面代码没有问题
  t = 1000;
  x = 1000;

  // a = "";
  // b = "";
  printLengths();

  final str = "hello world ";
  const strs = "hello world";
  print(str);
  print(strs);

  var say = (str) {
    print(str);
  };
  say("hello worlds");

  void execute(var callback) {
    callback();
  }

  execute(() => print("hahahaaha"));

  print(says("bob", "1231212w"));
  print(says("bob", "1231212w", "smoke signal"));

  // enableFlags(bold: true, hidden: true);
  // enableFlags(bold: true, hidden: false);
  // enableFlags(bold: false, hidden: true);

  Future.delayed(new Duration(seconds: 2), () {
    //  return "hi world";
    // throw AssertionError("Error");
  })
      .then((data) {
    //执行成功会走到这里
    print(data);
  }).catchError((onError) {
    //执行失败会走到这里
    print(onError + "1213123");
  }).onError((error, stackTrace) {
    //  then方法自带异常
    print(error.toString() + "3sdsds");
  }).whenComplete(() {
    // 无论成功或失败都会走到这里
    print("hahahah哈哈哈");
  });

  Future.wait([
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    }),
    Future.delayed(new Duration(seconds: 6), () => " flutter")
  ]).then((results) {
    print(results[0] + results[1] + results[2]);
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    print("执行完成");
  });

  //回调地狱callback hell 不建议
  // login("renbin", "1224556").then((id){
  //   //登录成功后通过，id获取用户信息
  //   getUserInfo(id).then((userInfo){
  //     //获取用户信息后保存
  //       saveUserInfo(userInfo).then((data){
  //         //保存用户信息，接下来执行其它操作
  //
  //       });
  //   });
  // });

  //正确写法
  // login("renbin", "123455").then((id) => getUserInfo(id))
  // .then((userInfo) => saveUserInfo(userInfo))
  // .then((e) => print("接下来的操作"))
  // .catchError((onError){
  //   //错误处理
  //   print(onError);
  // });

  //使用async/await消除callback hell
  // task() async{
  //   try{
  //     String id =  await login("renbin", "122345");
  //     String userinfo = await getUserInfo(id);
  //     await saveUserInfo(userinfo);
  //   //执行接下来的操作
  //   }catch(e){
  //     //错误处理
  //     print(e);
  //   }
  // }

  //IO流
  Stream.fromFutures([
    //1秒返回结果
    Future.delayed(new Duration(seconds: 1), () => "hello 1"),
    // 抛出一个异常
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("Error");
    }),
    // 3秒后返回结果
    Future.delayed(new Duration(seconds: 3), () {
      return "hello 3";
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e);
  }, onDone: () {});
}

/**
 * 获取asset内容
 */
Future<String> loadAsset() async {
  return await rootBundle.loadString("assets/images/icon_5.webp");
}

// Future<String> login(String username,String password){
//   //用户登录
//
// }
//
// Future<String> getUserInfo(String id){
//   //获取用户信息
// }
// Future saveUserInfo(String userInfo){
//   // 保存用户信息
// }

String says(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//设置[bold]和[hidden]标志
// void enableFlags({ bool? bold, bool? hidden}) {
//     if(bold! && hidden!){
//       print("11111111");
//     }else if(bold! && hidden!){
//       print("22222222");
//     }else if(bold! && hidden!){
//       print("3333333333");
//     }
// }

// bool isMobil(int isNumber){
//   return _mobileGase[isNumber] != null;
// }

//dynamic与Object不同的是,dynamic声明的对象编译器会提供所有可能的组合, 而Object声明的对象只能使用Object的属性与方法, 否则编译器会报错
void printLengths() {
  // no warning
  // print(a.length);
  // // warning:
  // // The getter 'length' is not defined for the class 'Object'
  // print(b.length);
}

import 'package:flutter/material.dart';
import 'package:flutter_view_demo/myProject/main/CurrentTab.dart';

//引入tabs


class RegisterThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("第三步-完成注册")),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text("输入密码完成注册"),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('确定'),
                onPressed: () {
                  //返回根，跳转到主页
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(builder: (context) => new CurrentTab(currentIndex:0)),
                      (route) => route == null);  //所有路由都置为空，在跳转到指定页面
                },
              )
            ],
          ),
        ));
  }
}

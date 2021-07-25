
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/LoginPage");
            }
                , child: Text("登录")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/RegisterFirstPage");
            }
                , child: Text("注册")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/routes/Routes.dart';

class TestTwelve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("命名路由传值"),
          ),
          body: NavigatorState()),
      onGenerateRoute: onGenerateRoute, //配置命名路由
    );
  }
}

class NavigatorState extends StatefulWidget {
  const NavigatorState({Key? key}) : super(key: key);

  @override
  _NavigatorStateState createState() => _NavigatorStateState();
}

class _NavigatorStateState extends State<NavigatorState> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/TestSeven");
              },
              child: Text("命名正常跳转")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/MingMinState",
                    arguments: {"id": 123, "name": "王"});
              },
              child: Text("命名路由传值")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/LoginPage");
              },
              child: Text("跳转到登录")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/RegisterFirstPage");
              },
              child: Text("跳转到注册")),
        ],
      ),
    );
  }
}

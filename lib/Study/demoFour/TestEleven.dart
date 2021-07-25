import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/ListPage.dart';

import 'TestTen.dart';

class TestEleven extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("路由，跳转"),),
          body: NavigatorState()
        ),
      routes: {       //命名路由
          "/TestTen" : (context) =>TestTen(),
          "/ListPage" : (context) =>ListPage("跳转到列表页面，并且传值"),
      },
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
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>TestTen())
            );
          },
              child: Text("跳转到主页")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ListPage("跳转到列表页面，并且传值"))
            );
          },
              child: Text("普通路由传值")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/ListPage");
          },
              child: Text("命名路由传值")),
        ],
      ),
    );
  }
}

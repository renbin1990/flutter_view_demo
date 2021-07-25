import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ContextRoute.dart';
import 'CounterWidget.dart';

 class TipRoute extends StatelessWidget{
  TipRoute({
    required this.text,  // 接收一个text参数
  }) : super();

  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(onPressed: () {
                Navigator.pop(context,"我是返回值");
              },
                child: Text("返回"),
              ),
              AppHome(),
              Echo(text: "Hello world"),
              FlatButton(onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                  return ContextRoute();
                }
                ));
              },
              child: Text("测试 Context"),
              ),
              FlatButton(onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return CounterWidget();
                    }
                    ));
              },
                child: Text("测试 StatefulWidget"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new FlatButton(
          onPressed: () {
            //debugDumpApp();
          },
          child: new Text('Dump App'),
        ),
      ),
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor:Colors.grey,
  }):super(key:key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}
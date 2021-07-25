import 'package:flutter/material.dart';


class MyFirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter demo"),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange    //主题
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "你好 fluter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 40.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  
}
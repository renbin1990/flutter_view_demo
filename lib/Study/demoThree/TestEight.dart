import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestEight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap组件"),
      ),
      body: WrapContent(),
    );
  }
}

/**
 * Wrap 实现流式布局
 */
class WrapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      color: Colors.orange,
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,   //横向间距
        runSpacing: 10, //竖间距
      //  alignment: WrapAlignment.center,   //X轴对齐方式
        runAlignment:WrapAlignment.center ,  //Y轴对其方式
        direction: Axis.horizontal,   //显示方向
        children: [
          MyButton("哈哈哈"),
          MyButton("哈哈哈发"),
          MyButton("哈哈哈请问请问"),
          MyButton("哈哈哈3"),
          MyButton("哈哈哈士大夫"),
          MyButton("哈哈"),
          MyButton("哈哈哈士大夫"),
          MyButton("哈哈哈隔热隔热个"),
          MyButton("哈"),
          MyButton("哈哈哈"),
          MyButton("哈哈哈发"),
          MyButton("哈哈哈请问请问"),
          MyButton("哈哈哈3"),
          MyButton("哈哈哈士大夫"),
          MyButton("哈哈"),
          MyButton("哈哈哈士大夫"),
          MyButton("哈哈哈隔热隔热个"),
          MyButton("哈"),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;

  const MyButton(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(title),
        style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        //change background color of button
        onPrimary: Colors.white,
        //change text color of button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        ), onPressed: () {  },
    );
  }
}

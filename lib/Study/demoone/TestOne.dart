import 'package:flutter/material.dart';

/**
 * Container组件 和 Text组件
 */
class TestOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter demo"),
        ),
        body: HomeContent());
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text("你好 flutter"),
      child: Container(
        child: Text(
          "你好 flutter fdssddfd是豆腐干豆腐干大范甘迪豆腐干豆腐干d",
          textAlign: TextAlign.center,
          //位置
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.cyan,
            fontWeight: FontWeight.bold,
            //设置字体加粗
            fontStyle: FontStyle.italic,
            //设置字体倾斜
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.white,
            decorationStyle: TextDecorationStyle.dashed,
            letterSpacing: 5.0, //字间距
          ),
          overflow: TextOverflow.clip,
          //设置文字超出一行的属性
          maxLines: 2,
          textScaleFactor: 1.2, //设置字体显示倍率
        ),
        height: 300.0,
        width: 200.0,
        //设置背景颜色
        decoration: BoxDecoration(
          color: Colors.yellow,
          //边框颜色
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.all(
              // Radius.circular(150)   //圆形
              Radius.circular(20)), //设置圆角
        ),
        //     padding:  EdgeInsets.all(5.0),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        // transform: Matrix4.translationValues(20, 10, 10),    //设置动画.
        alignment: Alignment.center, //设置位置
      ),
    );
  }
}

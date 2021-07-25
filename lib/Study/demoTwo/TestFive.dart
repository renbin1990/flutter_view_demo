import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFive extends StatelessWidget {
  List _list = [
    {
      "name":"Padding组件设置边距",
      "item":1
    },{
      "name":"Row设置水平布局",
      "item":2
    },{
      "name":"Column设置垂直布局",
      "item":3
    },{
      "name":"Expanded平分组件",
      "item":4
    },{
      "name":"row cliumn expanded混合嵌套开发实现布局",
      "item":5
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding，Row,Column,Expanded组件"),
      ),
      //      body: HomeContets(),
      //       body: RowContent(),
      //      body: ColumnContent(),
      //     body: ExpandedContent(),
     // body: AllContent(),
        body: ListView(
          children: _list.map((value){
            return Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text(value["name"]),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        switch(value["item"]){
                          case 1:
                            return HomeContets();
                          case 2:
                            return RowContent();
                          case 3:
                            return ColumnContent();
                          case 4:
                            return ExpandedContent();
                          case 5:
                            return AllContent();
                        }
                        return HomeContets();
                      })
                  );
                },
              ),
            );
          }).toList(),
        )
    );
  }
}

/**
 * Padding组件设置边距
 */
class HomeContets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //设置边距
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2Fv2-0831ab242b01a6de64757dfd7b0197d1_1200x500.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=95ba2f82595534bab9ccff6b3af7e251"),
        ),
      ),
    );
  }
}

/**
 * Row设置水平布局
 */
class RowContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 800,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //调整水平方向位置
          crossAxisAlignment: CrossAxisAlignment.center, //调整纵向位置
          children: <Widget>[
            IconContainer(Icons.home, size: 40, color: Colors.red),
            IconContainer(Icons.settings, size: 40, color: Colors.blueAccent),
            IconContainer(Icons.sanitizer, size: 40, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}

/**
 * Column设置垂直布局
 */
class ColumnContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //调整水平方向位置
          crossAxisAlignment: CrossAxisAlignment.center, //调整纵向位置
          children: <Widget>[
            IconContainer(Icons.home, size: 40, color: Colors.red),
            IconContainer(Icons.settings, size: 40, color: Colors.blueAccent),
            IconContainer(Icons.sanitizer, size: 40, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}

/**
 * Expanded平分组件
 */
class ExpandedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          IconContainer(Icons.home, size: 40, color: Colors.red),
          Expanded(
            child: IconContainer(Icons.sanitizer, size: 40, color: Colors.orange),
            flex: 2,
          ),
          Expanded(
            child:
            IconContainer(Icons.settings, size: 40, color: Colors.blueAccent),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

/**
 * row cliumn expanded混合嵌套开发实现布局
 */
class AllContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    "你好Flutter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/1.png",
                    fit: BoxFit.cover,
                  ),
                  height: 180,
                ),
                flex: 2,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Container(
                        height: 85,
                        child: Image.network(
                          "https://www.itying.com/images/flutter/1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 85,
                        child: Image.network(
                          "https://www.itying.com/images/flutter/1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  height: 180,
                ),
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double size = 32.0;
  Color color = Colors.white;
  IconData icon;

  IconContainer(this.icon, {required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}

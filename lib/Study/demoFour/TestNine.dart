import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestNine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget组件"),
        ),
//        body: HomeContent(),
       // body: ListStateContent(),
        body: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text("计数器"),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return HomeContent();
                      })
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text("list 动态添加数据"),
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return ListStateContent();
                      })
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 计数器
 */
class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        textDirection:TextDirection.rtl,
        children: [
          SizedBox(height: 200,),
          Chip(label: Text("你好 $count")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text("+1"),
          ),
        ],
      ),
    );
  }
}

/**
 * list 动态添加数据
 */
class ListStateContent extends StatefulWidget {
  const ListStateContent({Key? key}) : super(key: key);

  @override
  _ListStateContentState createState() => _ListStateContentState();
}

class _ListStateContentState extends State<ListStateContent> {

  List list = [];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: this.list.map((value){
              return ListTile(
                title: Text(value),
                subtitle: Text("这是内容"),
                leading: Icon(Icons.ac_unit_sharp),
              );
            }).toList(),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              setState(() {
                list.add("data $count");
                count++;
              });
            },
            child: Text("添加数据"),

          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child:
    Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: TabBar(
              isScrollable: true, //条目过多，自动滑动
               tabs: [
              Tab(text: "推荐",),
              Tab(text: "热门",),
              Tab(text: "实时",),
              Tab(text: "军事",),
            ],
            indicatorSize: TabBarIndicatorSize.label,))

          ],
        ),
      ),
      body: TabBarView(children: [
        ListView(
          children: [
            Text("第一个Tab"),
            Text("第一个Tab"),
            Text("第一个Tab"),
          ],
        ),
        ListView(
          children: [
            Text("第二个Tab"),
            Text("第二个Tab"),
            Text("第二个Tab"),
          ],
        ),
        ListView(
          children: [
            Text("第三个Tab"),
            Text("第三个Tab"),
            Text("第三个Tab"),
          ],
        ),
        ListView(
          children: [
            Text("第四个Tab"),
            Text("第四个Tab"),
            Text("第四个Tab"),
          ],
        ),
      ],
      ),
    ));
  }
}

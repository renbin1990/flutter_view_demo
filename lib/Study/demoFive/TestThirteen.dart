import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestThirteen extends StatefulWidget {
  const TestThirteen({Key? key}) : super(key: key);

  @override
  _TestThirteenState createState() => _TestThirteenState();
}

class _TestThirteenState extends State<TestThirteen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("自定义appbar、Tab"),
            centerTitle: true,
            //设置标题剧中
            backgroundColor: Colors.red,
            //添加自定义左侧图标
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            //添加右侧图标
            actions: [
              IconButton(
                iconSize: 32.0,
                  onPressed: () {
                    print("搜索");
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    print("设置");
                  },
                  icon: Icon(Icons.settings)),
            ],
            bottom: TabBar(tabs: [
              Tab(text: "组件1"),
              Tab(text: "组件2"),
            ]),
          ),
          body: TabBarView(children: [
            ListView(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/TestTen");
                }, child: Text("跳转主页设置tab")),
                Text("第一个Tab"),
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
                Text("第二个Tab"),
              ],
            ),
          ],
          ),
        ),
    );
  }
}

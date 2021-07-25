import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    //监听事件
    _tabController.addListener(() {
        print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabController实现顶部切换"),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: "Tab1",
            icon: Icon(Icons.ac_unit),
          ),
          Tab(
            text: "Bab2",
            icon: Icon(Icons.ac_unit),
          ),
          Tab(
            text: "Tab3",
            icon: Icon(Icons.ac_unit),
          )
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: new Text('第一个Tab')),
          Center(child: new Text('第二个Bab')),
          Center(child: new Text('第三个Tab')),
        ],
      ),
    );
  }
}


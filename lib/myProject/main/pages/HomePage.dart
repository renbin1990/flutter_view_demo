import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/myProject/main/CurrentTab.dart';
import 'package:flutter_view_demo/res/PageData.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print("监听tab切换 ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
          Tab(text: "组件一",),
          Tab(text: "组件二",)
        ],
          controller: _tabController,
        ),
      ),
      //添加左侧抽屉栏目
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage("https://img1.baidu.com/it/u=3487414028,2932761123&fm=26&fmt=auto&gp=0.jpg"),
                  fit: BoxFit.cover
                )
              ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://c-ssl.duitang.com/uploads/item/201511/19/20151119134519_QduTJ.thumb.1000_0.jpeg"),
                  ),
                  title: Text("name: xiaobin"),
                  subtitle: Text("sex: man"),
                )),
            Divider(),
            ListTile(
              title: Text("个人中心"),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
            ),
            Divider(), //横线
            ListTile(
              title: Text("注册"),
              leading: CircleAvatar(
                child: Icon(Icons.app_registration),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/RegisterFirstPage");
              },
            ),
            Divider(), //横线
            ListTile(
              title: Text("登录"),
              leading: CircleAvatar(
                child: Icon(Icons.login),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/LoginPage");
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: pageDataOne.map((e){
              return Card(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(e["routes"]),
                  onTap: (){
                    Navigator.pushNamed(context, e["title"]);
                  },
                ),
              );
            }).toList(),
          ),
          ListView(
            children: pageDataTwo.map((e){
              return Card(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(e["routes"]),
                  onTap: (){
                    Navigator.pushNamed(context, e["title"]);
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
    // return Column(
    //   children: [
    //     // Text(
    //     //   "各类组件",
    //     //   textAlign: TextAlign.center,
    //     //   style: TextStyle(fontSize: 20,
    //     //   color: Colors.amberAccent),
    //     // ),
    //
    //   ],
    // );
  }
}

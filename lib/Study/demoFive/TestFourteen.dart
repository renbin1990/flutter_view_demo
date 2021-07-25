import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFourteen extends StatefulWidget {
  const TestFourteen({Key? key}) : super(key: key);

  @override
  _TestFourteenState createState() => _TestFourteenState();
}

class _TestFourteenState extends State<TestFourteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer侧边栏布局"),
      ),
      //抽屉组件-左侧
      drawer: Drawer(
        child: Column(
          children: [
            Text("BoxDecoration实现头像相关"),
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img1.baidu.com/it/u=3487414028,2932761123&fm=26&fmt=auto&gp=0.jpg"),
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  Text("名字：XXXXXX"),
                  Text("Email：XXXXXX@qq.com"),
                ],
              ),
            ),
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
      endDrawer: Drawer(
        child: Column(
          children: [
            Text("UserAccountsDrawerHeader实现头像相关"),
            UserAccountsDrawerHeader(
                accountName: Text("小彬"),
                accountEmail: Text("123145@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://img1.baidu.com/it/u=3487414028,2932761123&fm=26&fmt=auto&gp=0.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage("https://c-ssl.duitang.com/uploads/item/201511/19/20151119134519_QduTJ.thumb.1000_0.jpeg"),
                  fit: BoxFit.cover
                )
              ),
            ),
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
    );
  }
}

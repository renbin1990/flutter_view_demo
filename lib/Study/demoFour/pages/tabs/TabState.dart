import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/page/HomePage.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/page/MessagePage.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/page/MinePage.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/page/SettingPage.dart';

class TabState extends StatefulWidget {
  final index ;
  TabState({Key? key, this.index = 0}) : super(key: key);

  @override
  _TabStateState createState() => _TabStateState(index);
}

class _TabStateState extends State<TabState> {
  int _currentIndex = 0;

  List<Widget> _pageList = [
    HomePage(),
    MessagePage(),
    SettingPage(),
    MinePage()
  ];

  _TabStateState(int currentIndex){
    this._currentIndex = currentIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottemNativigationBar组件"),),
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
   //     backgroundColor: Colors.red[600],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed,  //配置底部可以有多个按钮，否则超出3个会有问题
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text("消息")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("设置")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_sharp),
              title: Text("我的")
          )
        ],
      ),
    );
  }
}

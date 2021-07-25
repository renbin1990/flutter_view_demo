import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/myProject/main/pages/HomePage.dart';
import 'package:flutter_view_demo/myProject/main/pages/MyPage.dart';

class CurrentTab extends StatefulWidget {
  final currentIndex;
  CurrentTab({Key? key,this.currentIndex}) : super(key: key);

  @override
  _CurrentTabState createState() => _CurrentTabState(currentIndex);
}

class _CurrentTabState extends State<CurrentTab> {
  int _currentIndex = 0;
  _CurrentTabState(currentIndex){
    this._currentIndex = currentIndex;
  }

  List<Widget> _pageList = [
    HomePage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter学习"),
      ),
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;

          });
        },
        fixedColor: Colors.pinkAccent[100],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("我的")),
        ],
      ),
    );
  }
}

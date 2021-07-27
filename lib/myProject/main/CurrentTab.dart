import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/myProject/main/pages/AddPage.dart';
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
    AddPage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("flutter学习"),
      // ),
      floatingActionButton: Container(
   //     margin: EdgeInsets.only(top: 10),   //修改上边距
        height: 70,
        width: 70,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              this._currentIndex = 1;
            });
          },
          child: Icon(Icons.add,color: this._currentIndex == 1 ? Colors.white:Colors.black,size: 28,),
          backgroundColor: this._currentIndex == 1 ? Colors.red:Colors.yellow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("添加")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("我的")),
        ],
      ),
    );
  }
}

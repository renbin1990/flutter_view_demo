

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/res/ListData.dart';

class TestSix extends StatelessWidget{

  List _list = [
    {
      "name":"Stack 相当于RealLayout简单使用",
      "item":1
    },{
      "name":" 与Align混合使用",
      "item":2
    },{
      "name":"与Positioned混合使用",
      "item":3
    },{
      "name":"混合实现列表",
      "item":4
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stack,Align,Positioned组件"),),
        //   body: StackContents(),
        //     body: StackContent(),
        //     body: StacksContents(),
        //    body: HomeContent(),
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
                            return StackContents();
                          case 2:
                            return StackContent();
                          case 3:
                            return StacksContents();
                          case 4:
                            return HomeContent();
                        }
                        return StackContents();
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
 * Stack 相当于RealLayout  简单使用
 */
class StackContents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          //  alignment: Alignment.bottomRight,   //容器位置
          alignment: Alignment(
              -1,0.3
          ),
          children: [
            Container(
              height: 400,
              width: 300,
              color: Colors.red,
            ),
            Text("文本1"),
            Text("文本2"),
          ],
        ),
      ),
    );
  }
}

/**
 * Stack relativelayout  与Align混合使用
 */
class StackContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:   Container(
          height: 400,
          width: 300,
          color: Colors.red,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.home,size: 40,color: Colors.white,),
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(Icons.search,size: 40,color: Colors.yellow,),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.settings,size: 40,color: Colors.indigoAccent,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/**
 * Stack 相当于relativelayout  与Positioned混合使用
 */
class StacksContents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:   Container(
          height: 400,
          width: 300,
          color: Colors.red,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 20,
                child: Icon(Icons.home,size: 40,color: Colors.white,),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Icon(Icons.search,size: 40,color: Colors.yellow,),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Icon(Icons.settings,size: 40,color: Colors.indigoAccent,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 动态列表-ListView加载外部数据-混合实现列表
 */
class HomeContent extends StatelessWidget {

  Widget _weigth(context,index){
    return ListTile(
      title: Text(listData[index]["title"],
        style: TextStyle(
            color:Colors.deepOrange,
            fontSize: 16
        ),),
      subtitle: Text(listData[index]["author"]),
      leading: Image.network(listData[index]["imageUrl"]),
    );
  }

  List<Widget> _ListWeigth(){
    var list = listData.map((e){
      return Expanded(
          flex: 1,
          child: Container(
            child: Stack(
              children: [
                Image.network(e["imageUrl"]),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Text(
                      e["title"],
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                 left: 20,
                 child: Text(e["author"],
                     style: TextStyle(
                     color: Colors.cyanAccent,
                     fontSize: 18
                 ),),
                ),
              ],
            ),
          )
      );
    });
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: this._ListWeigth(),
      ),
    );
  }
}
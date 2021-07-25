
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/res/ListData.dart';

class TestSeven extends StatelessWidget{

  List _list = [
    {
      "name":"AspectRatio使用",
      "item":1
    },{
      "name":"Card实现普通列表",
      "item":2
    },{
      "name":"卡片布局实现外部数据加载",
      "item":3
    }
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(title: Text("AspectRatio、Card组件"),),
       //     body: AspectRatioContent(),
//       body: CardContent(),
//       body: CardContents(),
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
                           return AspectRatioContent();
                         case 2:
                           return CardContent();
                         case 3:
                           return CardContents();
                       }
                       return AspectRatioContent();
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


class AspectRatioContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AspectRatio(
        aspectRatio: 3.0/1.0,   //修改子元素狂高比
        child: Container(
          color: Colors.cyanAccent,
        ),
      ),
    );
  }
}

/**
 * 卡片布局实现普通列表
 */
class CardContent extends StatelessWidget{
  List<Widget> _getlist(){
    List<Widget> list = [];
    for(int i = 0 ;i < 10; i ++){
      list.add(
        Card(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                title: Text("张三",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight:FontWeight.bold ),),
                subtitle: Text("技术经理",style: TextStyle(color: Colors.grey,fontSize: 14),),
              ),
              ListTile(
                title: Text("电话：18502894685"),
              ),
              ListTile(
                title: Text("地址：北京市朝阳区火星"),
              )
            ],
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: this._getlist(),
      ),
    );
  }
}

/**
 * 卡片布局实现外部数据加载
 */
class CardContents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: listData.map((value){
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                AspectRatio(aspectRatio: 16/9,
                  child: Image.network(value["imageUrl"],fit: BoxFit.cover,),),
                ListTile(
                  title: Text(value["title"]),
                  subtitle: Text(value["description"],maxLines: 2,overflow: TextOverflow.ellipsis,),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(value["imageUrl"]),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
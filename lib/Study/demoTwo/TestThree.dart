import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/res/ListData.dart';

/**
 * ListView组件
 */
class TestThree extends StatelessWidget {
  List _list = [
    {
      "name":"普通列表使用",
      "item":1
    },{
      "name":"图文列表",
      "item":2
    },{
      "name":"水平列表布局",
      "item":3
    },{
      "name":"动态列表-自定义方法",
      "item":4
    },{
      "name":"动态列表-加载外部列表数据",
      "item":5
    },{
      "name":"动态列表-ListView.builder加载外部数据",
      "item":6
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView组件"),
      ),
      // body: HomeContent(),   //普通列表使用
      // body: HomeContents(),  //图文列表
      //    body: ListViewContent(),  //水平列表布局
      //     body: ListViewContents(), //动态列表-自定义方法
      //      body: ListContents(),   //动态列表-加载外部列表数据
      //     body: ListViewBuiderContent(),    //动态列表-ListView.builder加载外部数据
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
                          return HomeContent();
                        case 2:
                          return HomeContents();
                        case 3:
                          return ListViewContent();
                        case 4:
                          return ListViewContents();
                        case 5:
                          return ListContents();
                        case 6:
                          return ListViewBuiderContent();
                      }
                      return HomeContent();
                    })
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

/**
 * 普通列表使用
 */
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          ListTile(
            title: Text("listview标题演示"),
            subtitle: Text("二级标题演示1"),
            leading: Icon(
              Icons.wrong_location,
              color: Colors.yellow,
              size: 30,
            ),
            //图标
            trailing: Icon(
              Icons.wallet_giftcard_rounded,
              color: Colors.yellow,
              size: 30,
            ), //后面的图标
          ),
          ListTile(
            title: Text("网络图片"),
            subtitle: Text("二级标题演示2"),
            leading: Image.network(
                "https://pics4.baidu.com/feed/b151f8198618367a4e83cdc321f568d1b31ce536.jpeg?token=8961841436989fe3af737d06c3db0f83&s=B33BE06E8464C717150E41D80300F09A"), //图标
          ),
          ListTile(
            title: Text("listview标题演示"),
            subtitle: Text("二级标题演示3"),
            leading: Icon(Icons.home, color: Colors.yellow), //图标
          ),
          ListTile(
            title: Text("listview标题演示"),
            subtitle: Text("二级标题演示4"),
            leading: Icon(Icons.list, color: Colors.yellow), //图标
          ),
        ],
      ),
    );
  }
}

/**
 * 图文列表
 */
class HomeContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2Fv2-bdccac93dfee9fc078a7b21903fcc7fa_1200x500.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=a755981fb31c97b8aa1c823102dfd02a"),
          Container(
            height: 40,
            child: Text(
              "我的一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2Fv2-bdccac93dfee9fc078a7b21903fcc7fa_1200x500.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=a755981fb31c97b8aa1c823102dfd02a"),
          Container(
            height: 40,
            child: Text(
              "我的一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2Fv2-bdccac93dfee9fc078a7b21903fcc7fa_1200x500.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=a755981fb31c97b8aa1c823102dfd02a"),
          Container(
            height: 40,
            child: Text(
              "我的一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2Fv2-bdccac93dfee9fc078a7b21903fcc7fa_1200x500.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=a755981fb31c97b8aa1c823102dfd02a"),
          Container(
            height: 40,
            child: Text(
              "我的一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2Fv2-bdccac93dfee9fc078a7b21903fcc7fa_1200x500.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=a755981fb31c97b8aa1c823102dfd02a"),
        ],
      ),
    );
  }
}

/**
 * 水平列表布局
 */
class ListViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 160,
        child: ListView(
          scrollDirection: Axis.horizontal, //配置列表方向
          children: <Widget>[
            Container(
              width: 180,
              color: Colors.deepOrange,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Text("我是一个文本"),
                  Image.network(
                      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi2.wp.com%2Fsoftwareengineeringdaily.com%2Fwp-content%2Fuploads%2F2018%2F07%2FFlutterDart.png%3Fresize%3D730%2C389%26ssl%3D1&refer=http%3A%2F%2Fi2.wp.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629441032&t=fc3739e3fd4571aa648c9230fc083315")
                ],
              ),
            ),
            Container(
              width: 180,
              color: Colors.blue,
            ),
            Container(
              width: 180,
              color: Colors.yellow,
            ),
            Container(
              width: 180,
              color: Colors.cyanAccent,
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 动态列表-自定义方法
 */
class ListViewContents extends StatelessWidget {
//自定义放大
  List<Widget> _getData() {
    List<Widget> list = [];
    for(int i =0;i<20;i++){
      list.add(ListTile(
        title: Text("我是一个列表$i"),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: this._getData(),
      ),
    );
  }
}

/**
 * 动态列表-加载外部列表数据
 */
class ListContents extends StatelessWidget {
//自定义放大
  List<Widget> _getData() {
    var tempList = listData.map((value){
      return ListTile(
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
        leading: Image.network(value["imageUrl"]),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: this._getData(),
      ),
    );
  }
}

/**
 * 动态列表-ListView.builder加载数据
 */
class ListViewBuiderContents extends StatelessWidget {

  List<Widget> _list = [];
  ListViewBuiderContents(){
    for(int i =0;i<20;i++){
      _list.add(ListTile(
        title: Text("我是一个列表$i"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: this._list.length,
          itemBuilder: (context,index){
            return this._list[index];
          }
      ),
    );
  }
}

/**
 * 动态列表-ListView.builder加载外部数据
 */
class ListViewBuiderContent extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context,index){
            return _weigth(context,index);
          }
      ),
    );
  }
}
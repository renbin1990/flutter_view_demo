import 'package:flutter/material.dart';
import 'package:flutter_view_demo/res/ListData.dart';

class TestFour extends StatelessWidget {

  List _list = [
    {
      "name":"GridView基本使用",
      "item":1
    },{
      "name":"加载外部数据--静态网格",
      "item":2
    },{
      "name":"加载外部集合数据",
      "item":3
    },{
      "name":"加载外部数据-- GridViewBuilder",
      "item":4
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView组件"),
      ),
      //     body: GridViewContent(),
      //       body: GridViewContents(),
      //     body: GridViewContentes(),
    //  body: GridViewBuilderContents(),
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
                            return GridViewContent();
                          case 2:
                            return GridViewContents();
                          case 3:
                            return GridViewContentes();
                          case 4:
                            return GridViewBuilderContents();
                        }
                        return GridViewContent();
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
 * GridView基本使用
 */
class GridViewContent extends StatelessWidget {
  List<Widget> _getWidget() {
    List<Widget> list = [];
    for (int i = 1; i < 21; i++) {
      list.add(Container(
        // margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        child: Text(
          "我是第$i条数据",
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        //设置上下间距
        crossAxisSpacing: 10,
        //设置左右间距
        padding: EdgeInsets.all(10),
        children: this._getWidget(),
        childAspectRatio: 0.7, //宽度和高度的比例
      ),
    );
  }
}

/**
 * 加载外部集合数据
 */
class GridViewContentes extends StatelessWidget {
  List<Widget> _getWidgetList() {
    var list = listData.map((value) {
      return Container(
        height: 300,
        // margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 5), //设置高度
            Text(
              value["title"],
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    });
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        children: _getWidgetList(),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

/**
 * 加载外部数据--静态网格
 */
class GridViewContents extends StatelessWidget {
  List<Widget> _getWidgetList() {
    var list = listData.map((value) {
      return Container(
        height: 300,
        // margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 5), //设置高度
            Text(
              value["title"],
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      );
    });
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: EdgeInsets.all(10),
        children: _getWidgetList(),
      ),
    );
  }
}

/**
 * 加载外部数据-- GridViewBuilder
 */
class GridViewBuilderContents extends StatelessWidget {
  Widget _getWidget(context, index) {
    return Container(
      // margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"]),
          SizedBox(height: 5), //设置高度
          Text(
            listData[index]["title"],
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: listData.length,
        itemBuilder: this._getWidget,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.7),
      ),
    );
  }
}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesttwentYone extends StatefulWidget {
  const TesttwentYone({Key? key}) : super(key: key);

  @override
  _TesttwentYoneState createState() => _TesttwentYoneState();
}

class _TesttwentYoneState extends State<TesttwentYone> {
  ScrollController _scrollcontroller = ScrollController();
  List _list = [];
  int _page = 1;
  int _pageSize = 10;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    _getData();

    _scrollcontroller.addListener(() {
      print("滑动距离 ： ${_scrollcontroller.position.pixels}");
      print("页面高度 ： ${_scrollcontroller.position.maxScrollExtent}");

      if (_scrollcontroller.position.pixels >
          _scrollcontroller.position.maxScrollExtent - 20) {
        this._getData();
      }
    });
  }

  _getData() async {
    var response = await Dio().post(
        'http://154.8.161.99/dev-api/front/client/articl/getAppArticleList',
        data: {
          "isChoicest": 0,
          "title": "",
          "pageSize": _pageSize,
          "pageIndex": _page
        });

    if (response.statusCode == 200 && response.data["code"] == 0) {
      List data = response.data["data"];

      setState(() {
        _list.addAll(data);
        _page++;
      });

      if (data.length < _pageSize) {
        setState(() {
          this.flag = false;
        });
      }
    }
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      flag = true;
      _list.clear();
      _page = 1;
      _getData();
    });
  }

  /**
   *    加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    if (flag) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("------  我是有底线的   -------"),
      );
    }
  }

  Widget _getListItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(
          _list[index]["appTitle"],
          style: TextStyle(fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          _list[index]["introduction"],
          maxLines: 2,
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
        leading: Image.network(
          _list[index]["appImage"],
          width: 88,
          height: 88,
        ),
        onTap: (){
          Navigator.pushNamed(context, "/NewInfo",arguments: {
            "articleId":_list[index]["articleId"],
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新，上拉加载更多"),
      ),
      body: this._list.length > 0
          ? RefreshIndicator(
              child: ListView.builder(
                controller: _scrollcontroller,
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == _list.length - 1) {
                    return Column(
                      children: [
                        _getListItem(context, index),
                        Divider(),
                        _getMoreWidget()
                      ],
                    );
                  } else {
                    return _getListItem(context, index);
                  }
                },
              ),
              onRefresh: this._onRefresh)
          : _getMoreWidget(),
    );
  }
}

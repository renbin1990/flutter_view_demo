
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget{
  late String _title;

  ListPage(this._title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("搜索页面"),),
      body: ListView(
        children: [
          ListTile(
            title: Text(_title),
          ),
          ListTile(
            title: Text(_title),
          ),
          ListTile(
            title: Text(_title),
          ),
          ListTile(
            title: Text(_title),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(); //自定义返回
      },
        child: Text("返回"),
      ),
    );
  }
}
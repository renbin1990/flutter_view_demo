import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestTwenty extends StatefulWidget {
  const TestTwenty({Key? key}) : super(key: key);

  @override
  _TestTwentyState createState() => _TestTwentyState();
}

class _TestTwentyState extends State<TestTwenty> {

  var _list = [];

  @override
  void initState() {
    super.initState();
  }

  _getData() async{
    var response = await Dio().get('https://www.baidu.com');
   // showToast("${response.statusCode}");
    print(response);
  }

  /**
   * http://154.8.161.99/dev-api/front/client/articl/getAppArticleList
   * {
      "isChoicest": 0,
      "title": "",
      "pageSize": 15,
      "pageIndex": 1
      }
   */
  _postData() async{
    var response = await Dio().post('http://154.8.161.99/dev-api/front/client/articl/getAppArticleList',data:{
      "isChoicest": 0,
      "title": "",
      "pageSize": 15,
      "pageIndex": 1
    } );
 //   print(response);
    print(response.statusCode);
    print(response.data);
    if(response.statusCode == 200){
      setState(() {
        _list = response.data["data"];
      });
    }else{
      showToast("数据获取失败");
    }
  }


  void showToast(String data){
    Fluttertoast.showToast(
        msg: data,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dio数据请求"),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                this._postData();
              }, child: Text("Post数据请求")),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                this._getData();
              }, child: Text("get数据请求")),
            ],
          ),

          Expanded(child: Padding(padding: EdgeInsets.all(10),
            child: this._list.length >0 ?ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context,index){
                return ListTile(title: Text(this._list[index]["appTitle"]),);
              },
              shrinkWrap: true,):Text("暂无数据"),
          ))
        ],
      ),
    );
  }
}

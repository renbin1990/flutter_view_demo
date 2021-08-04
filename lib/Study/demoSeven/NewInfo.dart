import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'BaseData.dart';
import 'NewData.dart';

class NewInfo extends StatefulWidget {
  var arguments;

  NewInfo({Key? key, this.arguments}) : super(key: key);

  @override
  _NewInfoState createState() => _NewInfoState(this.arguments);
}

class _NewInfoState extends State<NewInfo> {
  var _data = null;
  var arguments;

  _NewInfoState(this.arguments);

  @override
  void initState() {
    super.initState();

    _getData();
  }

  _getData() async {
    Response response = await Dio().get(
        "http://154.8.161.99/dev-api/front/client/articl/getArticleById?articleId=${arguments["articleId"]}");
    print(response.statusCode);
    // var data = json.decode(response.toString());
    // BaseData bean = BaseData.fromJson(data);
    // print(bean.code);
    var data = response.data["data"];
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻详情"),
      ),
      body: _data == null
          ? Text("")
          : ListView(
              children: [
                Text(_data["appTitle"],textAlign: TextAlign.center,),
                Text(_data["pubTime"],textAlign: TextAlign.center,),
                //
                Html(data: _data["content"], style: {
                  // tables will have the below background color
                  "table": Style(
                    backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  ),
                  // some other granular customizations are also possible
                  "tr": Style(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  "th": Style(
                    padding: EdgeInsets.all(6),
                    backgroundColor: Colors.grey,
                  ),
                  "td": Style(
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.topLeft,
                  ),
                  // text that renders h1 elements will be red
                  "h1": Style(color: Colors.red),
                  "p": Style(fontSize: FontSize.large)
                }, tagsList: Html.tags..remove(Platform.isAndroid ? "iframe" : "video")
                )
              ],
            ),
    );
  }
}

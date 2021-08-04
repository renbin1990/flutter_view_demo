import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesttwentYTwo extends StatefulWidget {
  const TesttwentYTwo({Key? key}) : super(key: key);

  @override
  _TesttwentYTwoState createState() => _TesttwentYTwoState();
}

class _TesttwentYTwoState extends State<TesttwentYTwo> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("加载网页"),),
      body: WebView(
        initialUrl: 'https://flutter.cn',
      )
    );
  }
}

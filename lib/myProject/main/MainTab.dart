import 'package:flutter/material.dart';
import 'package:flutter_view_demo/routes/Routes.dart';

import 'CurrentTab.dart';

/**
 * 主页
 */
class MainTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,    //去掉debug图标
      home: Scaffold(
        body: CurrentTab(currentIndex:0),
      ),
      onGenerateRoute: onGenerateRoute, //配置命名路由
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/Study/demoFive/TestFourteen.dart';
import 'package:flutter_view_demo/Study/demoFive/TestThirteen.dart';
import 'package:flutter_view_demo/Study/demoFour/TestTen.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/MingMinPage.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/Login.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/RegisterFirst.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/RegisterSecond.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/RegisterThird.dart';
import 'package:flutter_view_demo/Study/demoThree/TestSeven.dart';
import 'package:flutter_view_demo/Study/demoFour/TestEleven.dart';
import 'package:flutter_view_demo/Study/demoFour/TestNine.dart';
import 'package:flutter_view_demo/Study/demoFour/TestTwelve.dart';
import 'package:flutter_view_demo/Study/demoThree/TestEight.dart';
import 'package:flutter_view_demo/Study/demoThree/TestSix.dart';
import 'package:flutter_view_demo/Study/demoTwo/TestFive.dart';
import 'package:flutter_view_demo/Study/demoTwo/TestFour.dart';
import 'package:flutter_view_demo/Study/demoTwo/TestThree.dart';
import 'package:flutter_view_demo/Study/demoone/TestOne.dart';
import 'package:flutter_view_demo/Study/demoone/TestTwo.dart';

//配置路由,定义Map类型的routes,Key为String类型，Value为Function类型
final Map<String,Function> routes={
    //  '/':(context)=>Tabs(),
      '/MingMinState':(context,{arguments})=>MingMinState(arguments:arguments),
      '/LoginPage':(context,{arguments})=>LoginPage(),
      '/RegisterFirstPage':(context,{arguments})=>RegisterFirstPage(),
      '/RegisterSecondPage':(context,{arguments})=>RegisterSecondPage(),
      '/RegisterThirdPage':(context,{arguments})=>RegisterThirdPage(),
      '/TestOne':(context)=>TestOne(),
      '/TestTwo':(context)=>TestTwo(),
      '/TestThree':(context)=>TestThree(),
      '/TestFour':(context)=>TestFour(),
      '/TestFive':(context)=>TestFive(),
      '/TestSix':(context)=>TestSix(),
      '/TestSeven':(context)=>TestSeven(),
      '/TestEight':(context)=>TestEight(),
      '/TestNine':(context)=>TestNine(),
      '/TestTen':(context)=>TestTen(),
      '/TestEleven':(context)=>TestEleven(),
      '/TestTwelve':(context)=>TestTwelve(),
      '/TestThirteen':(context)=>TestThirteen(),
      '/TestFourteen':(context)=>TestFourteen(),
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {      
      //String? 表示name为可空类型
      final String? name = settings.name; 
      //Function? 表示pageContentBuilder为可空类型
      final Function? pageContentBuilder = routes[name];      
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/Study/demoFive/TestFourteen.dart';
import 'package:flutter_view_demo/Study/demoFive/TestThirteen.dart';
import 'package:flutter_view_demo/Study/demoFour/TestTen.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/MingMinPage.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/Login.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/RegisterFirst.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/RegisterSecond.dart';
import 'package:flutter_view_demo/Study/demoFour/pages/user/RegisterThird.dart';
import 'package:flutter_view_demo/Study/demoSeven/NewInfo.dart';
import 'package:flutter_view_demo/Study/demoSeven/TestTwenty.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYEight.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYFive.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYFour.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYSeven.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYSix.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYThree.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYTwo.dart';
import 'package:flutter_view_demo/Study/demoSeven/TesttwentYone.dart';
import 'package:flutter_view_demo/Study/demoSix/TestEightteen.dart';
import 'package:flutter_view_demo/Study/demoSix/TestFifteen.dart';
import 'package:flutter_view_demo/Study/demoSix/TestNineteen.dart';
import 'package:flutter_view_demo/Study/demoSix/TestSeventeen.dart';
import 'package:flutter_view_demo/Study/demoSix/TestSixteen.dart';
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

//????????????,??????Map?????????routes,Key???String?????????Value???Function??????
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
      '/TestFifteen':(context)=>TestFifteen(),
      '/TestSixteen':(context)=>TestSixteen(),
      '/TestSeventeen':(context)=>TestSeventeen(),
      '/TestEightteen':(context)=>TestEightteen(),
      '/TestNineteen':(context)=>TestNineteen(),
      '/TestTwenty':(context)=>TestTwenty(),
      '/TesttwentYone':(context)=>TesttwentYone(),
      '/NewInfo':(context,{arguments})=>NewInfo(arguments:arguments),
      '/TesttwentYTwo':(context)=>TesttwentYTwo(),
      '/TesttwentYThree':(context)=>TesttwentYThree(),
      '/TesttwentYFour':(context)=>TesttwentYFour(),
      '/TesttwentYFive':(context)=>TesttwentYFive(),
      '/TesttwentYSix':(context)=>TesttwentYSix(),
      '/LocationVideoPlay':(context,{arguments})=>LocationVideoPlay(arguments:arguments),
      '/TesttwentYSeven':(context)=>TesttwentYSeven(),
      '/TesttwentYEight':(context)=>TesttwentYEight(),
};

//????????????
var onGenerateRoute=(RouteSettings settings) {      
      //String? ??????name???????????????
      final String? name = settings.name; 
      //Function? ??????pageContentBuilder???????????????
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
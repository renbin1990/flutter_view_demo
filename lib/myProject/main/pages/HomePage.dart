import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/res/PageData.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: pageData.map((e){
        return Card(
          margin: EdgeInsets.all(5),
          child: ListTile(
            title: Text(e["routes"]),
            onTap: (){
              Navigator.pushNamed(context, e["title"]);
            },
          ),
        );
      }).toList(),
    );
    // return Column(
    //   children: [
    //     // Text(
    //     //   "各类组件",
    //     //   textAlign: TextAlign.center,
    //     //   style: TextStyle(fontSize: 20,
    //     //   color: Colors.amberAccent),
    //     // ),
    //
    //   ],
    // );
  }
}

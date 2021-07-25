
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MingMinState extends StatefulWidget {
  var arguments;
  MingMinState({Key? key, this.arguments}) : super(key: key);

  @override
  _MingMinStateState createState() => _MingMinStateState(this.arguments);
}

class _MingMinStateState extends State<MingMinState> {
  Map arguments;
  _MingMinStateState(this.arguments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("命名路由接受值"),),
      body: Center(
        child: Column(
          children: [
            Text(arguments["id"].toString()),
            Text(arguments["name"]),
          ],
        ),
      ),
    );
  }
}

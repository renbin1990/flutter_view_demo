import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyDialog extends Dialog {
  final String text;
  var timer;
  MyDialog(this.text);

  _showTimer(context) {
    timer = Timer.periodic(Duration(milliseconds: 5000), (t) {
      showToast('自动关闭dialog');
      Navigator.pop(context);
      t.cancel();
    });
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
    _showTimer(context);
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: 300,
            height: 200,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text("标题"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: Text(this.text),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

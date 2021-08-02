import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/Study/demoSix/MyDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestNineteen extends StatefulWidget {
  const TestNineteen({Key? key}) : super(key: key);

  @override
  _TestNineteenState createState() => _TestNineteenState();
}

class _TestNineteenState extends State<TestNineteen> {
  _alertDialog() async {
    var result = await showDialog(
        barrierDismissible:false,  //表示点击灰色背景的时候是否消失弹出框，建议弹出框的时候加上此属性
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("我是AlertDialog"),
            content: Text("确定要取消吗？"),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop("取消");
                  },
                  child: Text("取消")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop("确定");
                  },
                  child: Text("确定"))
            ],
          );
        });
    showToast(result);
  }

  _simoleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("我是SimpleDialog"),
            children: [
              SimpleDialogOption(
                child: Text("选择框1"),
                onPressed: () {
                  Navigator.of(context).pop("选择框1");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("选择框2"),
                onPressed: () {
                  Navigator.of(context).pop("选择框2");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("选择框3"),
                onPressed: () {
                  Navigator.of(context).pop("选择框3");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("选择框4"),
                onPressed: () {
                  Navigator.of(context).pop("选择框4");
                },
              ),
            ],
          );
        });
    showToast(result);
  }

  _ModalBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text("账号密码登录"),
                  leading: Icon(Icons.account_box_rounded),
                  onTap: () {
                    Navigator.of(context).pop("账号密码登录");
                  },
                ),
                ListTile(
                  title: Text("手机号登录"),
                  leading: Icon(Icons.phone_android),
                  onTap: () {
                    Navigator.of(context).pop("手机号登录");
                  },
                ),
                ListTile(
                  title: Text("人脸识别登录"),
                  leading: Icon(Icons.account_box_outlined),
                  onTap: () {
                    Navigator.of(context).pop("人脸识别登录");
                  },
                ),
              ],
            ),
          );
        });
    showToast(result);
  }

  _Toast() async {
    Fluttertoast.showToast(
        msg: "This is Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
      appBar: AppBar(
        title: Text("dialog弹窗"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _alertDialog, child: Text("AlertDialog")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: _simoleDialog, child: Text("SimpleDialog")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: _ModalBottomSheet, child: Text("ModalBottomSheet")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(onPressed: _Toast, child: Text("Toast")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return MyDialog("我是自定义dialog");
              });
            }, child: Text("自定义Dialog")),
          ],
        ),
      ),
    );
  }
}

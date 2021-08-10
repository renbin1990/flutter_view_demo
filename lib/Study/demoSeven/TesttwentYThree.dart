import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_demo/res/ShowToast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TesttwentYThree extends StatefulWidget {
  const TesttwentYThree({Key? key}) : super(key: key);

  @override
  _TesttwentYThreeState createState() => _TesttwentYThreeState();
}

class _TesttwentYThreeState extends State<TesttwentYThree> {

  late AndroidDeviceInfo androidInfo;

  @override
  void initState() {
    super.initState();
    _getDevice();
  }

  _getDevice() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("获取设备信息"),),
      body: ListView(
          children: [
            ListTile(
              title: Text("version"),
              onTap: (){
                showToast("${androidInfo.version}");
              },
            ),
            ListTile(
              title: Text("board"),
              onTap: (){
                showToast("${androidInfo.board}");
              },
            ),
            ListTile(
              title: Text("bootloader"),
              onTap: (){
                showToast("${androidInfo.bootloader}");
              },
            ),
            ListTile(
              title: Text("brand"),
              onTap: (){
                showToast("${androidInfo.brand}");
              },
            ),
            ListTile(
              title: Text("device"),
              onTap: (){
                showToast("${androidInfo.device}");
              },
            ),
            ListTile(
              title: Text("fingerprint"),
              onTap: (){
                showToast("${androidInfo.fingerprint}");
              },
            ),
            ListTile(
              title: Text("display"),
              onTap: (){
                showToast("${androidInfo.display}");
              },
            ),
            ListTile(
              title: Text("hardware"),
              onTap: (){
                showToast("${androidInfo.hardware}");
              },
            ),
            ListTile(
              title: Text("host"),
              onTap: (){
                showToast("${androidInfo.host}");
              },
            ),
            ListTile(
              title: Text("id"),
              onTap: (){
                showToast("${androidInfo.id}");
              },
            ),ListTile(
              title: Text("manufacturer"),
              onTap: (){
                showToast("${androidInfo.manufacturer}");
              },
            ),ListTile(
              title: Text("model"),
              onTap: (){
                showToast("${androidInfo.model}");
              },
            ),ListTile(
              title: Text("product"),
              onTap: (){
                showToast("${androidInfo.product}");
              },
            ),ListTile(
              title: Text("tags"),
              onTap: (){
                showToast("${androidInfo.tags}");
              },
            ),ListTile(
              title: Text("type"),
              onTap: (){
                showToast("${androidInfo.type}");
              },
            ),ListTile(
              title: Text("isPhysicalDevice"),
              onTap: (){
                showToast("${androidInfo.isPhysicalDevice}");
              },
            ),ListTile(
              title: Text("androidId"),
              onTap: (){
                showToast("${androidInfo.androidId}");
              },
            ),
          ],
      ),
    );
  }
}

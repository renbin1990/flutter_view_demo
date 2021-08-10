import 'package:flutter_view_demo/res/ShowToast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesttwentYFour extends StatefulWidget {
  const TesttwentYFour({Key? key}) : super(key: key);

  @override
  _TesttwentYFourState createState() => _TesttwentYFourState();
}

class _TesttwentYFourState extends State<TesttwentYFour> {
  @override
  void initState() {
    super.initState();
//   批量申请权限
    requestAllPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("权限申请"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("动态申请定位权限"),
            onTap: (){
              requestPermission(0);
            },
          ),
          ListTile(
            title: Text("动态申请相机权限"),
            onTap: (){
              requestPermission(1);
            },
          ),
          ListTile(
            title: Text("动态申请存储权限"),
            onTap: (){
              requestPermission(2);
            },
          ),
          ListTile(
            title: Text("动态申请设备信息权限"),
            onTap: (){
              requestPermission(3);
            },
          ),
        ],
      ),
    );
  }

  /**
   * 批量申请权限
   */
  void requestAllPermission() async{
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.camera,
    ].request();
    print(statuses[Permission.location]);
  }

  void requestPermission(int type) async {
    //   申请权限
    late bool hasLocationPermission;
    if(type ==0){
      hasLocationPermission = await requestLocationPermission();
    }else if(type ==1){
      hasLocationPermission = await requestCameraPermission();
    }else if(type ==2){
      hasLocationPermission = await requestWritePermission();
    }else if(type ==3){
      hasLocationPermission = await requestCalendarPermission();
    }

    if (hasLocationPermission) {
      showToast("权限申请通过");
    } else {
      showToast("权限申请不通过");
    }
  }

  //   申请定位权限
  //   授予定位权限返回  true，    否则返回  false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
//已经授权
      return true;
    } else {
  //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> requestCameraPermission() async {
    //获取当前的权限
    var status = await Permission.camera.status;
    if (status == PermissionStatus.granted) {
//已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> requestWritePermission() async {
    //获取当前的权限
    var status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
//已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> requestCalendarPermission() async {
    //获取当前的权限
    var status = await Permission.phone.status;
    if (status == PermissionStatus.granted) {
//已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.phone.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}

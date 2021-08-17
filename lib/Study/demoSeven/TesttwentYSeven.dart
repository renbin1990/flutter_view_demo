
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesttwentYSeven extends StatefulWidget {
  const TesttwentYSeven({Key? key}) : super(key: key);

  @override
  _TesttwentYSevenState createState() => _TesttwentYSevenState();
}

class _TesttwentYSevenState extends State<TesttwentYSeven> {
  var subscription;
  String _netmessage = "";

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      _netStatus();
    });
  }

  _netStatus() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      setState(() {
        _netmessage = "当前处于移动网络";
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      setState(() {
        _netmessage = "当前处于WIFI网络";
      });
    }else{
      setState(() {
        _netmessage = "当前无网络";
      });
    }
  }
// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("网络状态监听"),),
      body: Center(
        child: Text("${this._netmessage}"),
      ),
    );
  }
}

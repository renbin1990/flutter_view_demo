import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


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


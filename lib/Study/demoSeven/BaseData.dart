

import 'NewData.dart';

class BaseData {
  late int code;
  late var msg;
  late NewData data;

  BaseData(this.code, this.data, this.msg) {}

  BaseData.fromJson(Map<String, dynamic> parsedJson)
      : code = parsedJson["code"],
        msg = parsedJson["msg"],
        data = parsedJson["data"];

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "msg": msg,
      "data": data
    };
  }
}

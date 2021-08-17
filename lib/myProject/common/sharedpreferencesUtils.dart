import 'package:shared_preferences/shared_preferences.dart';

class sharedpreferencesUtils{

    static Future<void> putString(key,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
  }

  static Future<String?> getString(key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(key);
  }


}
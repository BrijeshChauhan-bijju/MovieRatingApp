
import 'package:imdbmovieapp/utils/SharedPrefsKeys.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MemoryManagement {
  static late  SharedPreferences prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static void setUserName({@required String ?username}) {
    prefs.setString(SharedPrefsKeys.USER_NAME, username!);
  }

  static String? getUserName() {
    return prefs.getString(SharedPrefsKeys.USER_NAME);
  }

  static void setEmail({@required String ?email}) {
    prefs.setString(SharedPrefsKeys.USER_NAME, email!);
  }

  static String? getEmail() {
    return prefs.getString(SharedPrefsKeys.EMAIL);
  }

  //clear all values from shared preferences
  static void clearMemory() {
    prefs.clear();
  }

}

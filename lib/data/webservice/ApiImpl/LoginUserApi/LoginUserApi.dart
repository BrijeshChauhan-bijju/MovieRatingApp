
import 'package:firebase_database/firebase_database.dart';

abstract class LoginUserApi{
  Future<dynamic> getloginuserapi(String email,String password,DatabaseReference _userref);
}
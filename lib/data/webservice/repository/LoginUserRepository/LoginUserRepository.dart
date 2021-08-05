import 'package:firebase_database/firebase_database.dart';

abstract class LoginUserRepository {
  Future<dynamic> getloginuserrepository(
      String email, String password, DatabaseReference _userref);
}

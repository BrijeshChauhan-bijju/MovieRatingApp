import 'package:firebase_database/firebase_database.dart';
import 'package:imdbmovieapp/data/model/user_details.dart';

abstract class RegisterUserRepository {
  Future<dynamic> getregisteruserrepository(
      UserDetails userDetails, DatabaseReference _userref);
}

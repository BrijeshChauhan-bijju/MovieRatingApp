import 'package:firebase_database/firebase_database.dart';
import 'package:imdbmovieapp/data/model/user_details.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/RegisterUserApi/RegisterUserApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/RegisterUserRepository/RegisterUserRepository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  late RegisterUserApi _registerUserApi;

  RegisterUserRepositoryImpl(RegisterUserApi _registerUserApi) {
    this._registerUserApi = _registerUserApi;
  }

  @override
  Future getregisteruserrepository(
      UserDetails userDetails, DatabaseReference _userref) {
    return _registerUserApi.getregisteruserapi(userDetails, _userref);
  }
}

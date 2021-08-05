import 'package:firebase_database/firebase_database.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/LoginUserApi/LoginUserApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/LoginUserRepository/LoginUserRepository.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  late LoginUserApi _loginUserApi;

  LoginUserRepositoryImpl(LoginUserApi _loginUserApi) {
    this._loginUserApi = _loginUserApi;
  }

  @override
  Future getloginuserrepository(String email, String password, DatabaseReference _userref){
    return _loginUserApi.getloginuserapi(email, password, _userref);
  }

}

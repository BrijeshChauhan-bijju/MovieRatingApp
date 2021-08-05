import 'package:imdbmovieapp/data/webservice/repository/LoginUserRepository/LoginUserRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class LoginUserUseCase extends BaseUseCase<dynamic> {
  late LoginUserRepository _loginUserRepository;

  LoginUserUseCase(LoginUserRepository _loginUserRepository) {
    this._loginUserRepository = _loginUserRepository;
  }

  @override
  Future callapi([email, password, _userref]) {
    return _loginUserRepository
        .getloginuserrepository(email, password, _userref)
        .then((value) {
      print("usecase=>,$value");
    });
  }
}

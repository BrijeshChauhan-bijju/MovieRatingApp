import 'package:imdbmovieapp/data/webservice/repository/LoginUserRepository/LoginUserRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/RegisterUserRepository/RegisterUserRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class RegisterUserUseCase extends BaseUseCase<dynamic> {
  late RegisterUserRepository _registerUserRepository;

  RegisterUserUseCase(RegisterUserRepository _registerUserRepository) {
    this._registerUserRepository = _registerUserRepository;
  }

  @override
  Future callapi([userDetails,_userref]) {
    return _registerUserRepository.getregisteruserrepository(userDetails,_userref)
        .then((value) {
      print("usecase=>,$value");
    });
  }
}

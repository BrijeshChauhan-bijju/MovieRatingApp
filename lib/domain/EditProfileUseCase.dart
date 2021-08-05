import 'package:imdbmovieapp/data/webservice/repository/EditProfileRepository/EditProfileRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class EditProfileUseCase extends BaseUseCase<dynamic> {
  late EditProfileRepository _editProfileRepository;

  EditProfileUseCase(EditProfileRepository _editProfileRepository) {
    this._editProfileRepository = _editProfileRepository;
  }

  @override
  Future callapi([context, key, value, _userref, _imagefile]) {
    return _editProfileRepository.geteditprofilerepository(
        context, key, value, _userref, _imagefile);
  }
}

import 'package:imdbmovieapp/data/webservice/repository/MovieFullDetailsRepository/MovieFullDetailsRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class MovieFullDetailsUseCase extends BaseUseCase<dynamic> {
  late MovieFullDetailsRepository _movieFullDetailsRepository;

  MovieFullDetailsUseCase(
      MovieFullDetailsRepository _movieFullDetailsRepository) {
    this._movieFullDetailsRepository = _movieFullDetailsRepository;
  }

  @override
  Future callapi([videoid]) {
    return _movieFullDetailsRepository.getmoviefulldetailsrepositoty(videoid);
  }
}

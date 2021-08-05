import 'package:imdbmovieapp/data/webservice/repository/ComingSoonRepository/ComingSoonRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularTvShowsRepository/MostPopularTvShowsRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class ComingSoonUseCase extends BaseUseCase<dynamic> {
  late ComingSoonRepository _comingSoonRepository;

  ComingSoonUseCase(ComingSoonRepository _comingSoonRepository) {
    this._comingSoonRepository = _comingSoonRepository;
  }

  @override
  Future callapi() {
    return _comingSoonRepository.getcomingsoonrepositoty();
  }
}

import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularTvShowsRepository/MostPopularTvShowsRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class MostPopularTvShowsUseCase extends BaseUseCase<dynamic> {
  late MostPopularTvShowsRepository _mostPopularTvShowsRepository;

  MostPopularTvShowsUseCase(
      MostPopularTvShowsRepository _mostPopularTvShowsRepository) {
    this._mostPopularTvShowsRepository = _mostPopularTvShowsRepository;
  }

  @override
  Future callapi() {
    return _mostPopularTvShowsRepository.getmostpoplartvshowsrepositoty();
  }
}

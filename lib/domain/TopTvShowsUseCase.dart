import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/ToptvShowsRepository/TopTvShowsRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';


class TopTvShowsUseCase extends BaseUseCase<dynamic> {
  late TopTvShowsRepository _topTvShowsRepository;

  TopTvShowsUseCase(TopTvShowsRepository _topTvShowsRepository) {
    this._topTvShowsRepository = _topTvShowsRepository;
  }


  @override
  Future callapi() {
    return _topTvShowsRepository.gettoptvshowsrepositoty();
  }
}

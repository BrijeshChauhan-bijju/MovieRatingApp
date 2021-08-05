import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class TopMovieUseCase extends BaseUseCase<dynamic> {
  late TopMovieRepository _topMovieRepository;

  TopMovieUseCase(TopMovieRepository _topMovieRepository) {
    this._topMovieRepository = _topMovieRepository;
  }

  @override
  Future callapi() {
    return _topMovieRepository.gettopmovierepositoty();
  }
}

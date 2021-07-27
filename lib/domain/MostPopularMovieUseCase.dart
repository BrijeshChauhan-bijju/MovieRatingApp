import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';


class MostPopularMovieUseCase extends BaseUseCase<dynamic> {
  late MostPopularMovieRepository _mostPopularMovieRepository;

  MostPopularMovieUseCase(MostPopularMovieRepository _mostPopularMovieRepository) {
    this._mostPopularMovieRepository = _mostPopularMovieRepository;
  }


  @override
  Future callapi() {
    return _mostPopularMovieRepository.getmostpoplarmovierepositoty();
  }
}

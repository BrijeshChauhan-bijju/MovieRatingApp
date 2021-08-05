import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MovieWikipediaRepository/MovieWikipediaRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/YoutubeTrailerRepository/YoutubeTrailerRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class MovieWikipediaUseCase extends BaseUseCase<dynamic> {
  late MovieWikipediaRepository _movieWikipediaRepository;

  MovieWikipediaUseCase(MovieWikipediaRepository _movieWikipediaRepository) {
    this._movieWikipediaRepository = _movieWikipediaRepository;
  }

  @override
  Future callapi([videoid]) {
    return _movieWikipediaRepository.getmoviewikipediarepositoty(videoid);
  }
}

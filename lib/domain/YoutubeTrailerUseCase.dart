import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/YoutubeTrailerRepository/YoutubeTrailerRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';


class YoutubeTrailerUseCase extends BaseUseCase<dynamic> {
  late YoutubeTrailerRepository _youtubeTrailerRepository;

  YoutubeTrailerUseCase(YoutubeTrailerRepository _youtubeTrailerRepository) {
    this._youtubeTrailerRepository = _youtubeTrailerRepository;
  }




  @override
  Future callapi([videoid]) {
    return _youtubeTrailerRepository.getyoutubetrailerrepositoty(videoid);
  }
}

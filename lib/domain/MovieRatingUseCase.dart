import 'package:imdbmovieapp/data/webservice/repository/YoutubeTrailerRepository/YoutubeTrailerRepository.dart';
import 'package:imdbmovieapp/data/webservice/repository/movieRatingRepository/MovieRatingRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class MovieRatingUseCase extends BaseUseCase<dynamic> {
  late MovieRatingRepository _movieRatingRepository;

  MovieRatingUseCase(MovieRatingRepository _movieRatingRepository) {
    this._movieRatingRepository = _movieRatingRepository;
  }

  @override
  Future callapi([videoid]) {
    return _movieRatingRepository.getmovieratingrepositoty(videoid);
  }
}

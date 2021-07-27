import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieRatingApi/MovieRatingApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/movieRatingRepository/MovieRatingRepository.dart';

class MovieRatingRepositoryImpl implements MovieRatingRepository{
  late MovieRatingApi _movieRatingApi;
  MovieRatingRepositoryImpl(MovieRatingApi _movieRatingApi){
    this._movieRatingApi = _movieRatingApi;
  }

  @override
  Future getmovieratingrepositoty(String videoid) {
    return _movieRatingApi.getmovieratingapi(videoid);
  }


}
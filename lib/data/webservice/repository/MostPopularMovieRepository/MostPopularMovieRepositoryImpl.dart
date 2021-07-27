import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularMovieApi/MostPopularMoviesApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepository.dart';

class MostPopularMovieRepositoryImpl implements MostPopularMovieRepository{
  late MostPopularMoviesApi _mostPopularMoviesApi;
  MostPopularMovieRepositoryImpl(MostPopularMoviesApi _mostPopularMoviesApi){
    this._mostPopularMoviesApi = _mostPopularMoviesApi;
  }

  @override
  Future getmostpoplarmovierepositoty() {
    return _mostPopularMoviesApi.getmostpopularmoviesapi();
  }


}
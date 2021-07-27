import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularMovieApi/MostPopularMoviesApi.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/TopMoviesApi/TopMoviesApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepository.dart';

class TopMovieRepositoryImpl implements TopMovieRepository{
  late TopMoviesApi _topMoviesApi;
  TopMovieRepositoryImpl(TopMoviesApi _topMoviesApi){
    this._topMoviesApi = _topMoviesApi;
  }


  @override
  Future gettopmovierepositoty() {
    return _topMoviesApi.gettopmoviesapi();
  }


}
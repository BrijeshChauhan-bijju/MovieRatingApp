import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/theater_movies.dart';
import 'package:imdbmovieapp/data/model/top_movies.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/InTheaterMovieApi/InTheaterMovieApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularMovieApi/MostPopularMoviesApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/TopMoviesApi/TopMoviesApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/IntheaterMovieUseCase.dart';
import 'package:imdbmovieapp/domain/MostPopularMovieUseCase.dart';
import 'package:imdbmovieapp/domain/TopMovieUseCase.dart';

class HomeScreenProvider with ChangeNotifier {
  IntheaterMovieUseCase _intheaterMovieUseCase = IntheaterMovieUseCase(
      InTheaterMovieRepositoryImpl(InTheaterMovieApiImpl()));
  MostPopularMovieUseCase _mostPopularMovieUseCase = MostPopularMovieUseCase(
      MostPopularMovieRepositoryImpl(MostPopularMoviesApiImpl()));
  TopMovieUseCase _topMovieUseCase =
      TopMovieUseCase(TopMovieRepositoryImpl(TopMoviesApiImpl()));

  late TheaterMovies _theatermovies;

  get theatermovies => _theatermovies;

  late MostPopularMovies _mostPopularMovies;

  get mostPopularMovies => _mostPopularMovies;

  late TopMovies _topMovies;

  get topMovies => _topMovies;

  bool _isloading=true;

  get isloading => _isloading;

  void gettheatermovielist() async {
    _isloading = true;
      var responses = await Future.wait([
        _intheaterMovieUseCase.callapi(),
        _mostPopularMovieUseCase.callapi(),
        _topMovieUseCase.callapi()
      ]);
      _theatermovies = TheaterMovies.fromJson(responses[0]);
      _mostPopularMovies = MostPopularMovies.fromJson(responses[1]);
      _topMovies = TopMovies.fromJson(responses[2]);
    _isloading = false;
    notifyListeners();

  }
  @override
  void dispose() {
    super.dispose();

  }
}

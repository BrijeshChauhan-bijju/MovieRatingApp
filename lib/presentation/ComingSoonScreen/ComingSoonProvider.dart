import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/coming_soon.dart';
import 'package:imdbmovieapp/data/model/most_popular_movies.dart';
import 'package:imdbmovieapp/data/model/theater_movies.dart';
import 'package:imdbmovieapp/data/model/top_movies.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/ComingSoonApi/ComingSoonApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/InTheaterMovieApi/InTheaterMovieApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularMovieApi/MostPopularMoviesApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularTvShowsApi/MostPopularTvShowsApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/TopMoviesApi/TopMoviesApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/TopTvShowsApi/TopTvShowsApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/ComingSoonRepository/ComingSoonRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularMovieRepository/MostPopularMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularTvShowsRepository/MostPopularMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/TopMovieRepository/TopMovieRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/ToptvShowsRepository/TopTvShowsRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/ComingSoonUseCase.dart';
import 'package:imdbmovieapp/domain/IntheaterMovieUseCase.dart';
import 'package:imdbmovieapp/domain/MostPopularMovieUseCase.dart';
import 'package:imdbmovieapp/domain/MostPopularTvShowsUseCase.dart';
import 'package:imdbmovieapp/domain/TopMovieUseCase.dart';
import 'package:imdbmovieapp/domain/TopTvShowsUseCase.dart';

class ComingSoonProvider with ChangeNotifier {
  ComingSoonUseCase _comingSoonUseCase =
      ComingSoonUseCase(ComingSoonRepositoryImpl(ComingSoonApiImpl()));

  late ComingSoon _comingSoon;

  get comingsoon => _comingSoon;

  bool _isloading = true;

  get isloading => _isloading;

  void getcomingsoonlist() async {
    _isloading = true;
    var responses = await Future.wait([
      _comingSoonUseCase.callapi(),
    ]);
    _comingSoon = ComingSoon.fromJson(responses[0]);
    _isloading = false;
    notifyListeners();
  }

  // setloading(bool boolvalue){
  //   _isloading = boolvalue;
  //   notifyListeners();
  // }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/Youtubetrailer.dart';
import 'package:imdbmovieapp/data/model/movie_full_details.dart';
import 'package:imdbmovieapp/data/model/movie_rating.dart';
import 'package:imdbmovieapp/data/model/movie_wikipedia.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieFullDetailsApi/MovieFullDetailsApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieRatingApi/MovieRatingApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieWikipediaApi/MovieWikipediaApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/YoutubetrailerApi/YoutubetrailerApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/MovieFullDetailsRepository/MovieFullDetailsRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/MovieWikipediaRepository/MovieWikipediaRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/YoutubeTrailerRepository/YoutubeTrailerRepositoryImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/movieRatingRepository/MovieRatingRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/MovieFullDetailsUseCase.dart';
import 'package:imdbmovieapp/domain/MovieRatingUseCase.dart';
import 'package:imdbmovieapp/domain/MovieWikipediaUseCase.dart';
import 'package:imdbmovieapp/domain/YoutubeTrailerUseCase.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';

class RatingDetailScreenProvider with ChangeNotifier {
  MovieFullDetailsUseCase _movieFullDetailsUseCase = MovieFullDetailsUseCase(
      MovieFullDetailsRepositoryImpl(MovieFullDetailsApiImpl()));
  YoutubeTrailerUseCase _youtubeTrailerUseCase = YoutubeTrailerUseCase(
      YoutubeTrailerRepositoryImpl(YoutubetrailerApiImpl()));

  late MovieFullDetails _movieFullDetails;

  get movieFullDetails => _movieFullDetails;

  late Youtubetrailer _youtubetrailer;

  get youtubetrailer => _youtubetrailer;

  late bool _isloading = true;

  get isloading => _isloading;

  void getyoutubetrailer(String videoid) async {

    var responses = await Future.wait([
      _youtubeTrailerUseCase.callapi(videoid),
      _movieFullDetailsUseCase.callapi(videoid),
    ]);
    _youtubetrailer = Youtubetrailer.fromJson(responses[0]);
    _movieFullDetails = MovieFullDetails.fromJson(responses[1]);

    setloading(false);
    notifyListeners();
  }

  late bool _flag = true;

  get flag => _flag;

  void setflag(bool flag) {
    _flag = !flag;
    notifyListeners();
  }

  Color _favoritecolor = Colors.white;

  get favoritecolor => _favoritecolor;

  void setfavoritebutton(Color iconcolor) {
    if (iconcolor == Colors.white) {
      _favoritecolor = AppColors.primaryColor;
    } else {
      _favoritecolor = Colors.white;
    }
    notifyListeners();
  }

  void setloading(bool booleanvalue){
    _isloading = booleanvalue;
    notifyListeners();
  }
}

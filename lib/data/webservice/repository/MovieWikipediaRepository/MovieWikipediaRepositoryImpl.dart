import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieWikipediaApi/MovieWikipediaApi.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/YoutubetrailerApi/YoutubetrailerApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/MovieWikipediaRepository/MovieWikipediaRepository.dart';

class MovieWikipediaRepositoryImpl implements MovieWikipediaRepository{
  late MovieWikipediaApi _movieWikipediaApi;
  MovieWikipediaRepositoryImpl(MovieWikipediaApi _movieWikipediaApi){
    this._movieWikipediaApi = _movieWikipediaApi;
  }

  @override
  Future getmoviewikipediarepositoty(String videoid) {
    return _movieWikipediaApi.getmoviewikipediaapi(videoid);
  }


}
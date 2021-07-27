import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/InTheaterMovieApi/InTheaterMovieApi.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieRatingApi/MovieRatingApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class MovieRatingApiImpl implements MovieRatingApi {
  @override
  Future getmovieratingapi(String videoid) async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.movierating}$videoid");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

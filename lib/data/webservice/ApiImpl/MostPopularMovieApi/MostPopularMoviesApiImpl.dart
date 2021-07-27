import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/InTheaterMovieApi/InTheaterMovieApi.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularMovieApi/MostPopularMoviesApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class MostPopularMoviesApiImpl implements MostPopularMoviesApi {
  @override
  Future getmostpopularmoviesapi()async {
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.mostpopularmovie}");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

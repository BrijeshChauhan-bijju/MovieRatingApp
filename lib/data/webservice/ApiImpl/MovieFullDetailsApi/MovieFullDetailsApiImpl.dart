import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieFullDetailsApi/MovieFullDetailsApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class MovieFullDetailsApiImpl implements MovieFullDetailsApi {
  @override
  Future getmoviefulldetailsapi(String videoid)async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.moviefulldetails}$videoid/FullActor,Posters,Images,Trailer,Ratings,Wikipedia");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

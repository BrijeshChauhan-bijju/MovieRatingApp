import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieWikipediaApi/MovieWikipediaApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class MovieWikipediaApiImpl implements MovieWikipediaApi {
  @override
  Future getmoviewikipediaapi(String videoid) async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.moviewikipedia}$videoid");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

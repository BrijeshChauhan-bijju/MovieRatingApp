import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularTvShowsApi/MostPopularTvShowsApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class MostPopularTvShowsApiImpl implements MostPopularTvShowsApi {
  @override
  Future getmostpopulartvshowsapi() async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.mostpopulartvshows}");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

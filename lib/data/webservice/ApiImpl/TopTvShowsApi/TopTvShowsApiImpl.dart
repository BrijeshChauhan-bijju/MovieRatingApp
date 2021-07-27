import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/TopTvShowsApi/TopTvShowsApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class TopTvShowsApiImpl implements TopTvShowsApi {
  @override
  Future gettoptvshowsapi() async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.toptvshows}");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

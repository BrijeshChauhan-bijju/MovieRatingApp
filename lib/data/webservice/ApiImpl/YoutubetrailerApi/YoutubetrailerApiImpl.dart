import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/YoutubetrailerApi/YoutubetrailerApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class YoutubetrailerApiImpl implements YoutubetrailerApi {
  @override
  Future getyoutubetrailerapi(String videoid) async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.youtubetrailer}$videoid");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

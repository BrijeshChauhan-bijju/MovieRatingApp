import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/ComingSoonApi/ComingSoonApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class ComingSoonApiImpl implements ComingSoonApi {
  @override
  Future getcomingsoonapi() async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.comingsoon}");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

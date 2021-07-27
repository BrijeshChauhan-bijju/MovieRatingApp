import 'dart:async';
import 'package:imdbmovieapp/data/webservice/ApiImpl/SearchAllApi/SearchAllApi.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIHandler.dart';
import 'package:imdbmovieapp/utils/networkmodel/APIs.dart';
import 'package:imdbmovieapp/utils/networkmodel/apierror.dart';

class SearchAllApiImpl implements SearchAllApi {
  @override
  Future getsearchallapi(String keyword) async{
    Completer<dynamic> completer = new Completer<dynamic>();
    var response = await APIHandler.get(url: "${APIs.searchall}$keyword");
    if (response is APIError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}

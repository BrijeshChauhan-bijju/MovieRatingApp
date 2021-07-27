import 'package:flutter/foundation.dart';
import 'package:imdbmovieapp/data/model/search_all.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/SearchAllApi/SearchAllApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/SearchAllRepository/SearchAllRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/SearchAllUseCase.dart';

class SearchScreenProvider extends ChangeNotifier {
  SearchAllUseCase _searchAllUseCase =
      SearchAllUseCase(SearchAllRepositoryImpl(SearchAllApiImpl()));

  SearchAll _searchAll= SearchAll();

  get searchAll => _searchAll;

  bool _isloading = false;

  get isloading => _isloading;

  void getsearchresult(String keyword) async {
    _isloading = true;
    var response = await _searchAllUseCase.callapi(keyword);

    _searchAll = SearchAll.fromJson(response);
    _isloading = false;
    notifyListeners();
  }
}

import 'package:imdbmovieapp/data/webservice/ApiImpl/SearchAllApi/SearchAllApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/SearchAllRepository/SearchAllRepository.dart';

class SearchAllRepositoryImpl implements SearchAllRepository{
  late SearchAllApi _searchAllApi;
  SearchAllRepositoryImpl(SearchAllApi _searchAllApi){
    this._searchAllApi = _searchAllApi;
  }

  @override
  Future getsearchallrepository(String keyword) {
    return _searchAllApi.getsearchallapi(keyword);
  }


}
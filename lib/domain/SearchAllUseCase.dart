import 'package:imdbmovieapp/data/webservice/repository/SearchAllRepository/SearchAllRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';


class SearchAllUseCase extends BaseUseCase<dynamic> {
  late SearchAllRepository _searchAllRepository;

  SearchAllUseCase(SearchAllRepository _searchAllRepository) {
    this._searchAllRepository = _searchAllRepository;
  }

  @override
  Future callapi([keyword]) {
    return _searchAllRepository.getsearchallrepository(keyword);
  }
}

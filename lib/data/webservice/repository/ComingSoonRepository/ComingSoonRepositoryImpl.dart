import 'package:imdbmovieapp/data/webservice/ApiImpl/ComingSoonApi/ComingSoonApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/ComingSoonRepository/ComingSoonRepository.dart';

class ComingSoonRepositoryImpl implements ComingSoonRepository {
  late ComingSoonApi _comingSoonApi;

  ComingSoonRepositoryImpl(ComingSoonApi _comingSoonApi) {
    this._comingSoonApi = _comingSoonApi;
  }

  @override
  Future getcomingsoonrepositoty() {
    return _comingSoonApi.getcomingsoonapi();
  }
}

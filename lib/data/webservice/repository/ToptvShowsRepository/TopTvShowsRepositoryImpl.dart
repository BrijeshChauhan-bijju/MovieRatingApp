import 'package:imdbmovieapp/data/webservice/ApiImpl/TopTvShowsApi/TopTvShowsApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/ToptvShowsRepository/TopTvShowsRepository.dart';

class TopTvShowsRepositoryImpl implements TopTvShowsRepository{
  late TopTvShowsApi _topTvShowsApi;
  TopTvShowsRepositoryImpl(TopTvShowsApi _topTvShowsApi){
    this._topTvShowsApi = _topTvShowsApi;
  }
  @override
  Future gettoptvshowsrepositoty() {
    return _topTvShowsApi.gettoptvshowsapi();
  }


}
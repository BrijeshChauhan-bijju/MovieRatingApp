import 'package:imdbmovieapp/data/webservice/ApiImpl/MostPopularTvShowsApi/MostPopularTvShowsApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/MostPopularTvShowsRepository/MostPopularTvShowsRepository.dart';

class MostPopularTvShowsRepositoryImpl implements MostPopularTvShowsRepository{
  late MostPopularTvShowsApi _mostPopularTvShowsApi;
  MostPopularTvShowsRepositoryImpl(MostPopularTvShowsApi _mostPopularTvShowsApi){
    this._mostPopularTvShowsApi = _mostPopularTvShowsApi;
  }
  @override
  Future getmostpoplartvshowsrepositoty() {
    return _mostPopularTvShowsApi.getmostpopulartvshowsapi();
  }


}
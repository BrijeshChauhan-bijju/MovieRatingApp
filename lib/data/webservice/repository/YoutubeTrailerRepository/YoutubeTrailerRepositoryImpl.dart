import 'package:imdbmovieapp/data/webservice/ApiImpl/TopMoviesApi/TopMoviesApi.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/YoutubetrailerApi/YoutubetrailerApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/YoutubeTrailerRepository/YoutubeTrailerRepository.dart';

class YoutubeTrailerRepositoryImpl implements YoutubeTrailerRepository{
  late YoutubetrailerApi _youtubetrailerApi;
  YoutubeTrailerRepositoryImpl(YoutubetrailerApi _youtubetrailerApi){
    this._youtubetrailerApi = _youtubetrailerApi;
  }

  @override
  Future getyoutubetrailerrepositoty(String videoid) {
    return _youtubetrailerApi.getyoutubetrailerapi(videoid);
  }


}
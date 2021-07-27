import 'package:imdbmovieapp/data/webservice/ApiImpl/MovieFullDetailsApi/MovieFullDetailsApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/MovieFullDetailsRepository/MovieFullDetailsRepository.dart';

class MovieFullDetailsRepositoryImpl implements MovieFullDetailsRepository{
  late MovieFullDetailsApi _movieFullDetailsApi;
  MovieFullDetailsRepositoryImpl(MovieFullDetailsApi _movieFullDetailsApi){
    this._movieFullDetailsApi = _movieFullDetailsApi;
  }
  @override
  Future getmoviefulldetailsrepositoty(String videoid) {
    return _movieFullDetailsApi.getmoviefulldetailsapi(videoid);
  }


}
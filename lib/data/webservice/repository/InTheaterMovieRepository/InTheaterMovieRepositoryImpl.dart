import 'package:imdbmovieapp/data/webservice/ApiImpl/InTheaterMovieApi/InTheaterMovieApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';

class InTheaterMovieRepositoryImpl implements InTheaterMovieRepository{
  late InTheaterMovieApi _inTheaterMovieApi;
  InTheaterMovieRepositoryImpl(InTheaterMovieApi _inTheaterMovieApi){
    this._inTheaterMovieApi = _inTheaterMovieApi;
  }
  @override
  Future getIntheaterMovieList() {
    return _inTheaterMovieApi.getintheatermovie();
  }


}
import 'package:imdbmovieapp/data/webservice/repository/InTheaterMovieRepository/InTheaterMovieRepository.dart';
import 'package:imdbmovieapp/domain/BaseUseCase.dart';

class IntheaterMovieUseCase extends BaseUseCase<dynamic> {
  late InTheaterMovieRepository _inTheaterMovieRepository;

  IntheaterMovieUseCase(InTheaterMovieRepository _inTheaterMovieRepository) {
    this._inTheaterMovieRepository = _inTheaterMovieRepository;
  }

  @override
  Future callapi() {
    return _inTheaterMovieRepository.getIntheaterMovieList();
  }
}

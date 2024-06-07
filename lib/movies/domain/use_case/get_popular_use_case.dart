import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>>  call(NoParameters parameters) async{
    return await baseMoviesRepository.getPopular();

  }
}
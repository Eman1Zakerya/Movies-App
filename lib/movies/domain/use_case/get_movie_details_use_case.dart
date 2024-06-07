import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../error/failure.dart';
import '../entities/movie_details.dart';
import '../repository/base_movie_repository.dart';


class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
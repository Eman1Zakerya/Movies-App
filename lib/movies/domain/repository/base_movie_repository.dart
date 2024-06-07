import 'package:dartz/dartz.dart';
import 'package:movies_app/Weather/data/data_source/remote_data_source.dart';
import 'package:movies_app/movies/domain/use_case/get_movie_details_use_case.dart';

import '../../../error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';
import '../use_case/get_recommendation_use_case.dart';

abstract class BaseMoviesRepository{


  Future<Either<Failure, List<Movie>>>  getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>>  getPopular();
  Future<Either<Failure, List<Movie>>>  getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
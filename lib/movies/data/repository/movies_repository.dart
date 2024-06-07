import 'package:dartz/dartz.dart';
import 'package:movies_app/error/exceptions.dart';
import 'package:movies_app/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_use_case.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../data_source/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async{
   final  result  =  await baseMovieRemoteDataSource.getNowPlayingMovies() ;

   try{
     return Right(result );

   }on ServerException catch(failure){
     return left(ServerFailure(failure.errorMessageModel.statusMessage));

   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular() async{
   final result  = await baseMovieRemoteDataSource.getPopularMovies();

   try{
     return Right(result );

   }on ServerException catch(failure){
     return left(ServerFailure(failure.errorMessageModel.statusMessage));

   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result  = await baseMovieRemoteDataSource.getTopRatedMovies();

    try{
      return Right(result );

    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));

    }

  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
    await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



}
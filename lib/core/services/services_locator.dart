import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/data/data_source/movie_remote_data_source.dart';
import '../../movies/domain/use_case/get_popular_use_case.dart';
import '../../movies/domain/use_case/get_top_rated_use_case.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';


// This is our global ServiceLocator
//GetIt getIt = GetIt.instance;
GetIt sl = GetIt.instance;
class ServicesLocator{
   void init(){
     // movie bloc
     sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
     sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
     //useCases
     sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
     sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
     sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
     sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
     sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
     // repository
     sl.registerLazySingleton<BaseMoviesRepository>(
             () => MoviesRepository(sl()));
     // Data source
  sl.registerLazySingleton<BaseMovieRemoteDataSource>
    (() => MovieRemoteDataSource());
   }
}
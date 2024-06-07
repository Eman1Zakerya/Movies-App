part of 'movies_bloc.dart';


abstract class MoviesEvent extends Equatable{
  MoviesEvent();
  List<Object?> get props =>[];
}

class GetNowPlayingMoviesEvent  extends MoviesEvent{}
class GetPopularMoviesEvent  extends MoviesEvent{}
class GetTopRatedMoviesEvent  extends MoviesEvent{}



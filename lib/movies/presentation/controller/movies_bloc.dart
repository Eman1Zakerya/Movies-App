
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing_use_case.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../domain/use_case/get_popular_use_case.dart';
import '../../domain/use_case/get_top_rated_use_case.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase
      ) : super(const MoviesState()) {

    on<GetNowPlayingMoviesEvent>(_getNowPlaying);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

    // on<GetPopularMoviesEvent>((event, emit) async{
    //    final result = await getPopularMoviesUseCase.execute();
    //
    //    result.fold((l) =>
    //        emit(
    //          state.copyWith(
    //              popularState: RequestState.error,
    //              popularMessage:l.message
    //          )
    //           ),
    //            (r) =>  emit(
    //              state.copyWith(
    //                  popularMovies: r,
    //                  popularState:RequestState.loaded
    //              )
    //        ));
    // });

  }

  FutureOr<void> _getNowPlaying(
      GetNowPlayingMoviesEvent event,
      Emitter<MoviesState> emit) async{
    emit( const MoviesState(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    print(result);
    result.fold((l) =>
        emit(
            state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage:l.message
            )
        ),
            (r) =>  emit(
            state.copyWith(
                nowPlayingMovies: r,
                nowPlayingState:RequestState.loaded
            )

        ));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event,
      Emitter<MoviesState> emit) async {

    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold((l) =>
        emit(
            state.copyWith(
                popularState: RequestState.error,
                popularMessage:l.message
            )
        ),
            (r) =>  emit(
            state.copyWith(
                popularMovies: r,
                popularState:RequestState.loaded
            )
        ));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event,
      Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold((l) =>
        emit(
            state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage:l.message
            )
        ),
            (r) =>  emit(
            state.copyWith(
                topRatedMovies: r,
                topRatedState:RequestState.loaded
            )
        ));
  }
}



import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase,) : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularPlayingMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedPlayingMovies);
  }


  FutureOr<void> _getNowPlayingMovies(GetNowPlayingEvent event,
      Emitter<MoviesState>emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
          (l) =>
          emit(
              state.copyWith(nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,)
          ),
          (r) =>
          emit(
              state.copyWith(nowPlayingState: RequestState.loaded,
                nowPlayingMovies: r,)),
    );
  }

  FutureOr<void> _getPopularPlayingMovies(GetPopularMoviesEvent event,
      Emitter<MoviesState>emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
          (l) =>
          emit(state.copyWith(popularPlayingState: RequestState.error,
            popularPlayingMessage: l.message,)),
          (r) =>
          emit(state.copyWith(popularPlayingState: RequestState.loaded,
            popularPlayingMovies: r,)),
    );
  }

  FutureOr<void> _getTopRatedPlayingMovies(GetTopRatedMoviesEvent event,
      Emitter<MoviesState>emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
          (l) =>
          emit(state.copyWith(topRatedPlayingState: RequestState.error,
            topRatedPlayingMessage: l.message,)),
          (r) =>
          emit(state.copyWith(topRatedPlayingState: RequestState.loaded,
            topRatedPlayingMovies: r,)),
    );
  }
}
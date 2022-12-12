import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularPlayingMovies;
  final RequestState popularPlayingState;
  final String popularPlayingMessage;
  final List<Movie> topRatedPlayingMovies;
  final RequestState topRatedPlayingState;
  final String topRatedPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularPlayingMovies = const [],
    this.popularPlayingState = RequestState.loading,
    this.popularPlayingMessage = '',
    this.topRatedPlayingMovies = const [],
    this.topRatedPlayingState = RequestState.loading,
    this.topRatedPlayingMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularPlayingMovies,
    RequestState? popularPlayingState,
    String? popularPlayingMessage,
    List<Movie>? topRatedPlayingMovies,
    RequestState? topRatedPlayingState,
    String? topRatedPlayingMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.popularPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularPlayingMessage:
          popularPlayingMessage ?? this.popularPlayingMessage,
      popularPlayingMovies: popularPlayingMovies ?? this.popularPlayingMovies,
      popularPlayingState: popularPlayingState ?? this.popularPlayingState,
      topRatedPlayingMessage:
          topRatedPlayingMessage ?? this.topRatedPlayingMessage,
      topRatedPlayingMovies:
          topRatedPlayingMovies ?? this.topRatedPlayingMovies,
      topRatedPlayingState: topRatedPlayingState ?? this.topRatedPlayingState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularPlayingMovies,
        popularPlayingState,
        popularPlayingMessage,
        topRatedPlayingMovies,
        topRatedPlayingState,
        topRatedPlayingMessage,
      ];
}

import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///MOVIES BLOC
    sl.registerFactory(
      () => MoviesBloc(sl(), sl(), sl()),
    );

    ///USE CASES
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(sl()),
    );

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataResource>(
      () => MovieRemoteDataResource(),
    );
  }
}

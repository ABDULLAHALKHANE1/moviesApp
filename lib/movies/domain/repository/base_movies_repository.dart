import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

abstract class BaseMoviesRepository
{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>>  getTopRatedMovies();

  Future<Either<Failure,MovieDetail>> getMovieDetail(parameters);
}
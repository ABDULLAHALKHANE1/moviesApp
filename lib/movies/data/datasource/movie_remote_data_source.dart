import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataResource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<MovieDetailsModel> getMovieDetails(int idMovie);
}

class MovieRemoteDataResource extends BaseMovieRemoteDataResource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(ApiConstance.nowPopularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e),

        ),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(ApiConstance.nowTopRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int idMovie) async{
    final response = await Dio().get(ApiConstance.movieDetailsPath(idMovie));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }


}

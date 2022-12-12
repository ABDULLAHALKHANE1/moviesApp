import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.generes,
    required super.overview,
    required super.runtime,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      generes: List<GenresModel>.from(
        json['genres'].map((x)=>GenresModel.fromJson(x)),
      ),
      overview: json['overview'],
      runtime: json['runtime'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
    );
  }
}

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

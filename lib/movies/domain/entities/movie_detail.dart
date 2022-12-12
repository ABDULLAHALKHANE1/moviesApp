import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genres> generes;
  final String overview;
  final int runtime;
  final String releaseDate;
  final String title;
  final String voteAverage;

  const MovieDetail(
      {required this.backdropPath,
      required this.id,
        required  this.generes,
        required this.overview,
      required this.runtime,
      required this.releaseDate,
      required this.title,
      required this.voteAverage});

  @override
  List<Object?> get props =>
      [backdropPath, id, overview, runtime, releaseDate, title, voteAverage];
}

class Genres extends Equatable{
  final int id;
  final String name;

  const Genres({required this.id, required this.name});

  @override
  List<Object?> get props => [id,name];
}

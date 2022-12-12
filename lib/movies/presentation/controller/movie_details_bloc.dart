import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }
final GetMovieDetailsUseCase getMovieDetailsUseCase ;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)
  async{
    final result =await getMovieDetailsUseCase(event.id);
result.fold((l) => null, (r) => null);
  }
}
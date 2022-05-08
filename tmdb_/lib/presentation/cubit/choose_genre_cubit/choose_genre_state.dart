part of 'choose_genre_cubit.dart';

abstract class ChooseGenreState extends Equatable {
  const ChooseGenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends ChooseGenreState {}

class GenreLoading extends ChooseGenreState {}

class GenreLoaded extends ChooseGenreState {
  final List<MovieEntity> movies;
  const GenreLoaded({
    required this.movies,
  });
}

class GenreError extends ChooseGenreState {
  final String errormsg;
  const GenreError({
    required this.errormsg,
  });
}

class GetGenre extends ChooseGenreState {
  final List<Genre> genres;
  GetGenre({
    required this.genres,
  });
}

part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class Initial extends FavoriteState {}

class Loading extends FavoriteState {}

class Loaded extends FavoriteState {
  final List<FavoriteEntity> movies;
  const Loaded({
    required this.movies,
  });
  @override
  List<Object> get props => [movies];
}

class Error extends FavoriteState {
  final String msg;
  const Error({
    required this.msg,
  });
}

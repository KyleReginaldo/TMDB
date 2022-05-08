part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {
  final String msg;
  const SearchEmpty({
    required this.msg,
  });
}

class SearchLoaded extends SearchState {
  final List<MovieEntity> movies;
  const SearchLoaded({
    required this.movies,
  });
}

class SearchError extends SearchState {
  final String error;
  const SearchError({
    required this.error,
  });
}

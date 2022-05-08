part of 'trending_cubit.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingLoaded({
    required this.movies,
  });
}

class TrendingError extends TrendingState {
  final String error;
  TrendingError({
    required this.error,
  });
}

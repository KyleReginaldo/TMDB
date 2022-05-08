part of 'upcoming_cubit.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final List<MovieEntity> movies;
  UpcomingLoaded({
    required this.movies,
  });
}

class UpcomingError extends UpcomingState {
  final String error;
  UpcomingError({
    required this.error,
  });
}

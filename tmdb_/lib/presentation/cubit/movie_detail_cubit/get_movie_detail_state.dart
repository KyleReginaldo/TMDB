part of 'get_movie_detail_cubit.dart';

abstract class GetMovieDetailState extends Equatable {
  const GetMovieDetailState();

  @override
  List<Object> get props => [];
}

class GetMovieDetailInitial extends GetMovieDetailState {}

class GetMovieDetailLoading extends GetMovieDetailState {}

class GetMovieDetailLoaded extends GetMovieDetailState {
  final MovieDetail movieDetail;
  GetMovieDetailLoaded({
    required this.movieDetail,
  });
}

class GetMovieDetailError extends GetMovieDetailState {
  final String error;
  GetMovieDetailError({
    required this.error,
  });
}

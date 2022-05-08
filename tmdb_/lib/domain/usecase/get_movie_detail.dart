import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/errors/failure/seerver_failure.dart';
import '../../core/usecase/usecase.dart';
import '../entity/movie_detail.dart';
import '../repository/movie_repository.dart';

class GetMovieDetail implements UseCase<MovieDetail, MovieDetailParams> {
  final MovieRepository repo;
  GetMovieDetail({
    required this.repo,
  });
  @override
  Future<Either<ServerFailure, MovieDetail>> call(
      MovieDetailParams params) async {
    return await repo.getSpecMovie(
      id: params.id,
    );
  }
}

class MovieDetailParams extends Equatable {
  final int id;
  MovieDetailParams({
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

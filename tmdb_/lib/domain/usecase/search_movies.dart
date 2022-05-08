import 'package:dartz/dartz.dart';

import '../../core/errors/failure/seerver_failure.dart';

import '../../core/usecase/usecase.dart';
import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

class SearchMovies implements UseCase<List<MovieEntity>, SearchMovieParams> {
  final MovieRepository repo;
  SearchMovies({
    required this.repo,
  });
  @override
  Future<Either<ServerFailure, List<MovieEntity>>> call(
      SearchMovieParams params) async {
    return await repo.searchMovies(query: params.query);
  }
}

class SearchMovieParams {
  final String query;
  SearchMovieParams({
    required this.query,
  });
}

import 'package:dartz/dartz.dart';

import 'package:damovie/core/errors/failure/seerver_failure.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/entity/genre.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class GetGenres implements UseCase<List<Genre>, NoParams> {
  final MovieRepository repo;
  GetGenres({
    required this.repo,
  });

  @override
  Future<Either<ServerFailure, List<Genre>>> call(NoParams params) async {
    return await repo.getGenre();
  }
}

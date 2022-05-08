import 'package:dartz/dartz.dart';

import 'package:damovie/core/errors/failure/seerver_failure.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/entity/movie_entity.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class ChooseGenre implements UseCase<List<MovieEntity>, ChooseParams> {
  final MovieRepository repo;
  ChooseGenre({
    required this.repo,
  });
  @override
  Future<Either<ServerFailure, List<MovieEntity>>> call(
      ChooseParams params) async {
    return await repo.chooseGenre(genreid: params.genreid);
  }
}

class ChooseParams {
  final int genreid;
  ChooseParams({
    required this.genreid,
  });
}

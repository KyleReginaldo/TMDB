import 'package:dartz/dartz.dart';

import 'package:damovie/core/errors/failure/seerver_failure.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/entity/cast_entity.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class GetCast implements UseCase<List<CastEntity>, CastParams> {
  final MovieRepository repo;
  GetCast({
    required this.repo,
  });
  @override
  Future<Either<ServerFailure, List<CastEntity>>> call(
      CastParams params) async {
    return await repo.getCast(params.id);
  }
}

class CastParams {
  final int id;
  CastParams({
    required this.id,
  });
}

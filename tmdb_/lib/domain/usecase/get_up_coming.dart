import 'package:dartz/dartz.dart';

import '../../core/errors/failure/seerver_failure.dart';
import '../../core/usecase/usecase.dart';
import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

class GetUpComing implements UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repo;
  GetUpComing({
    required this.repo,
  });
  @override
  Future<Either<ServerFailure, List<MovieEntity>>> call(NoParams params) async {
    return await repo.getUpComing();
  }
}

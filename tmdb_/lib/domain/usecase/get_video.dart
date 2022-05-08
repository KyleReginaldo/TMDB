import 'package:dartz/dartz.dart';

import 'package:damovie/core/errors/failure/seerver_failure.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/entity/video_entity.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class GetVideo implements UseCase<List<VideoEntity>, VideoParams> {
  final MovieRepository repo;
  GetVideo({
    required this.repo,
  });
  @override
  Future<Either<ServerFailure, List<VideoEntity>>> call(
      VideoParams params) async {
    return await repo.getVideos(params.id);
  }
}

class VideoParams {
  final int id;

  VideoParams(this.id);
}

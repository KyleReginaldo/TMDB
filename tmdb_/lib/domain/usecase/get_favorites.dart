import 'package:damovie/core/errors/failure/cache_failure.dart';
import 'package:damovie/domain/entity/favorite.dart';
import 'package:dartz/dartz.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class GetFavorites implements USecase<List<FavoriteEntity>, NoParams> {
  final MovieRepository repo;
  GetFavorites({
    required this.repo,
  });

  @override
  Future<Either<CachedFailure, List<FavoriteEntity>>> call(
      NoParams params) async {
    return await repo.getFavorite();
  }
}

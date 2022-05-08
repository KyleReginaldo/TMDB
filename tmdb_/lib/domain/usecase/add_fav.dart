import 'package:damovie/core/errors/failure/cache_failure.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/entity/favorite.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class AddFavorite implements Usecase<void, FavoriteEntity> {
  final MovieRepository repo;
  AddFavorite({
    required this.repo,
  });

  @override
  Future<void> call(FavoriteEntity params) async =>
      await repo.addFavorite(favorites: params);
}

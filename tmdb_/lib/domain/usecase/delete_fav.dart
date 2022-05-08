import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/repository/movie_repository.dart';

class DeleteFavorite implements Usecase<void, FavoriteIdParams> {
  final MovieRepository repo;
  DeleteFavorite({
    required this.repo,
  });

  @override
  Future<void> call(FavoriteIdParams params) async =>
      await repo.deleteFavorite(id: params.id);
}

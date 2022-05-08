import 'package:bloc/bloc.dart';
import 'package:damovie/core/usecase/usecase.dart';
import 'package:damovie/domain/entity/favorite.dart';
import 'package:equatable/equatable.dart';
import 'package:damovie/domain/entity/movie_entity.dart';
import 'package:damovie/domain/usecase/add_fav.dart';
import 'package:damovie/domain/usecase/delete_fav.dart';
import 'package:damovie/domain/usecase/get_favorites.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(
    this._getFavorites,
    this._addFavorite,
    this._deleteFavorite,
  ) : super(Initial());

  final GetFavorites _getFavorites;
  final AddFavorite _addFavorite;
  final DeleteFavorite _deleteFavorite;

  void getFavorites() async {
    emit(Loading());

    final eitherFavOrError = await _getFavorites.call(NoParams());

    eitherFavOrError.fold(
        (l) => emit(
              const Error(msg: 'empty'),
            ), (movies) {
      print('movies: $movies');
      emit(
        Loaded(movies: movies),
      );
    });
  }

  void addFavorites(FavoriteEntity movie) async {
    await _addFavorite(
      movie,
    );
  }

  void deleteFavorite(int id) async {
    await _deleteFavorite(
      FavoriteIdParams(
        id: id,
      ),
    );
  }
}

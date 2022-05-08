import 'package:bloc/bloc.dart';
import 'package:damovie/domain/entity/genre.dart';
import 'package:damovie/domain/entity/movie_entity.dart';
import 'package:damovie/domain/usecase/choose_genre.dart';
import 'package:equatable/equatable.dart';

part 'choose_genre_state.dart';

class ChooseGenreCubit extends Cubit<ChooseGenreState> {
  ChooseGenreCubit(
    this._chooseGenre,
  ) : super(GenreInitial());

  final ChooseGenre _chooseGenre;

  void chooseGenre({required int id}) async {
    emit(GenreLoading());
    final eitherResultOrError =
        await _chooseGenre.call(ChooseParams(genreid: id));
    eitherResultOrError.fold(
        (l) => emit(const GenreError(errormsg: 'cant find genre!')), (results) {
      emit(GenreLoaded(movies: results));
    });
  }
}

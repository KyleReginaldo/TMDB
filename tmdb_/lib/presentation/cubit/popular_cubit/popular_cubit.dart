import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/usecase/get_popular.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this._getPopular) : super(PopularInitial());

  final GetPopular _getPopular;

  void getPopular() async {
    emit(PopularLoading());
    final eitherPopularOrError = await _getPopular.call(NoParams());
    eitherPopularOrError.fold(
      (l) => emit(
        PopularError(error: 'error'),
      ),
      (movies) => emit(
        PopularLoaded(movies: movies),
      ),
    );
  }
}

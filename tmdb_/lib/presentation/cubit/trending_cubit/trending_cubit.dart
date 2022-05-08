import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/usecase/get_trending.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(this._getTrending) : super(TrendingInitial());

  final GetTrending _getTrending;

  void getTrending() async {
    emit(TrendingLoading());
    final eitherMoviesOrError = await _getTrending.call(NoParams());
    eitherMoviesOrError.fold((l) => emit(TrendingError(error: 'error')),
        (movie) {
      emit(
        TrendingLoaded(movies: movie),
      );
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/usecase/now_playin.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this._getNowPlaying) : super(NowPlayingInitial());
  final GetNowPlaying _getNowPlaying;

  void getNowPlaying() async {
    emit(NowPlayingLoading());
    final eitherPlayingOrError = await _getNowPlaying.call(
      NoParams(),
    );
    eitherPlayingOrError.fold(
      (l) => emit(NowPlayingError(error: 'error')),
      (movies) => emit(
        NowPlayingLoaded(movies: movies),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/usecase/get_up_coming.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit(this._getUpComing) : super(UpcomingInitial());

  final GetUpComing _getUpComing;

  void getUpComing() async {
    emit(UpcomingLoading());
    final eitherUpcomingOrError = await _getUpComing.call(NoParams());
    eitherUpcomingOrError
        .fold((l) => emit(UpcomingError(error: 'maya ko na lagyan')), (movies) {
      emit(UpcomingLoaded(movies: movies));
    });
  }
}

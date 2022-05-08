import 'package:bloc/bloc.dart';
import 'package:damovie/domain/entity/cast_entity.dart';
import 'package:damovie/domain/usecase/get_cast.dart';
import 'package:equatable/equatable.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this._getCast) : super(CastInitial());

  final GetCast _getCast;

  void getCast(int id) async {
    emit(CastLoading());
    final eitherCastOrEError = await _getCast(CastParams(id: id));
    eitherCastOrEError.fold(
      (l) => emit(const CastError(msg: '')),
      (casts) => emit(
        CastLoaded(cast: casts),
      ),
    );
  }
}

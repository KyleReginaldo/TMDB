part of 'cast_cubit.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> cast;
  const CastLoaded({
    required this.cast,
  });
}

class CastError extends CastState {
  final String msg;
  const CastError({
    required this.msg,
  });
}

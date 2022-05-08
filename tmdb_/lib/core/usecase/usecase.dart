import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:damovie/core/errors/failure/cache_failure.dart';

import '../errors/failure/seerver_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ServerFailure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FavoriteIdParams extends Equatable {
  @override
  List<Object?> get props => [id];
  final int id;
  FavoriteIdParams({
    required this.id,
  });
}

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class USecase<Type, Params> {
  Future<Either<CachedFailure, Type>> call(Params params);
}

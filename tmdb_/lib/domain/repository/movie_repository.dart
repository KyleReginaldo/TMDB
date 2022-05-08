import 'package:damovie/core/errors/failure/cache_failure.dart';
import 'package:damovie/domain/entity/cast_entity.dart';
import 'package:damovie/domain/entity/favorite.dart';
import 'package:damovie/domain/entity/genre.dart';
import 'package:damovie/domain/entity/video_entity.dart';

import '../entity/movie_detail.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure/seerver_failure.dart';
import '../entity/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure, List<MovieEntity>>> getTrending();
  Future<Either<ServerFailure, List<MovieEntity>>> getPopular();
  Future<Either<ServerFailure, List<MovieEntity>>> getNowPlaying();
  Future<Either<ServerFailure, List<MovieEntity>>> getUpComing();
  Future<Either<ServerFailure, MovieDetail>> getSpecMovie({required int id});
  Future<Either<ServerFailure, List<MovieEntity>>> searchMovies(
      {required String query});
  Future<Either<ServerFailure, List<Genre>>> getGenre();
  Future<Either<ServerFailure, List<MovieEntity>>> chooseGenre(
      {required int genreid});
  Future<void> addFavorite({required FavoriteEntity favorites});
  Future<void> deleteFavorite({required int id});
  Future<Either<CachedFailure, List<FavoriteEntity>>> getFavorite();
  Future<Either<ServerFailure, List<VideoEntity>>> getVideos(int id);
  Future<Either<ServerFailure, List<CastEntity>>> getCast(int id);
}

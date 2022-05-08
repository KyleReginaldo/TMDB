import 'package:damovie/core/errors/Exception/cache_exception.dart';
import 'package:damovie/data/models/genre_model.dart';
import 'package:damovie/data/table/favorite_table.dart';
import 'package:damovie/domain/entity/cast_entity.dart';
import 'package:damovie/domain/entity/favorite.dart';
import 'package:damovie/domain/entity/video_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:damovie/data/datasource/local_data_soure.dart';
import '../../core/errors/Exception/server_exception.dart';
import '../../core/errors/failure/cache_failure.dart';
import '../../core/errors/failure/seerver_failure.dart';
import '../../domain/entity/movie_detail.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remote;
  final LocalDataSource local;
  MovieRepositoryImpl({
    required this.remote,
    required this.local,
  });
  @override
  Future<Either<ServerFailure, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remote.getTrending();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remote.getPopular();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getNowPlaying() async {
    try {
      final movies = await remote.getNowPlaying();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getUpComing() async {
    try {
      final movies = await remote.getUpComing();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, MovieDetail>> getSpecMovie({
    required int id,
  }) async {
    try {
      final movieDetail = await remote.getSpecMovie(id: id);
      return Right(movieDetail);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> searchMovies(
      {required String query}) async {
    try {
      final movieresult = await remote.searchMovies(query: query);
      return Right(movieresult);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> chooseGenre(
      {required int genreid}) async {
    try {
      final movieGenres = await remote.chooseGenre(genreid: genreid);
      return Right(movieGenres);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<GenreModel>>> getGenre() async {
    try {
      final genres = await remote.getGenre();
      return Right(genres);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> deleteFavorite({required int id}) async =>
      await local.deleteFavorite(id: id);

  @override
  Future<Either<CachedFailure, List<FavoriteEntity>>> getFavorite() async {
    try {
      final response = await local.getFavorites();
      return Right(response);
    } on CachedException {
      return Left(CachedFailure());
    }
  }

  @override
  Future<void> addFavorite({required FavoriteEntity favorites}) async =>
      await local.addFavorite(
        FavoriteTable.fromFavoriteEntity(favorites),
      );

  @override
  Future<Either<ServerFailure, List<VideoEntity>>> getVideos(int id) async {
    try {
      final videos = await remote.fetchVideos(id);
      return Right(videos);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<CastEntity>>> getCast(int id) async {
    try {
      final cast = await remote.getCast(id);
      return Right(cast);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

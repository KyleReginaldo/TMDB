import 'package:damovie/domain/entity/favorite.dart';
import 'package:equatable/equatable.dart';
import 'movie_detail.dart';

class MovieEntity extends Equatable {
  final String? title;
  final String? overview;
  final String? releaseDate;
  final String? backdropPath;
  final String? originalTitle;
  final String? posterPath;
  final int? voteCount;
  final double? voteAverage;
  final int? id;
  final List<int>? genres;
  const MovieEntity({
    this.title,
    this.overview,
    this.releaseDate,
    this.backdropPath,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.voteAverage,
    this.id,
    this.genres,
  });
  @override
  List<Object?> get props => [
        id,
        title,
      ];
  factory MovieEntity.fromMovieDetailEntity(MovieDetail movieDetailEntity) {
    return MovieEntity(
      posterPath: movieDetailEntity.posterPath,
      id: movieDetailEntity.id,
      backdropPath: movieDetailEntity.backdropPath,
      title: movieDetailEntity.title,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
    );
  }
  factory MovieEntity.fromFavorite(FavoriteEntity favorite) {
    return MovieEntity(
      title: favorite.title,
      overview: favorite.overview,
      releaseDate: favorite.releaseDate,
      backdropPath: favorite.backdropPath,
      originalTitle: favorite.originalTitle,
      posterPath: favorite.posterPath,
      voteAverage: favorite.average,
      voteCount: favorite.voteCount,
      id: favorite.id,
      genres: favorite.genresId,
    );
  }
}

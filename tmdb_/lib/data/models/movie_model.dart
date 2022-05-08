import 'package:damovie/data/models/genre_model.dart';

import '../../domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    double? voteAverage,
    String? title,
    String? overview,
    String? releaseDate,
    this.adult,
    String? backdropPath,
    List<int>? genreIds,
    int? voteCount,
    this.originalLanguage,
    String? originalTitle,
    String? posterPath,
    int? id,
    this.video,
    this.popularity,
    this.mediaType,
  }) : super(
          title: title,
          overview: overview,
          backdropPath: backdropPath,
          releaseDate: releaseDate,
          originalTitle: originalTitle,
          posterPath: posterPath,
          voteCount: voteCount,
          voteAverage: voteAverage,
          id: id,
        );

  final bool? adult;

  final String? originalLanguage;
  final bool? video;
  final double? popularity;
  final String? mediaType;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        overview: json["overview"],
        releaseDate: json['release_date'],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        voteCount: json["vote_count"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        id: json["id"],
        video: json["video"],
        popularity: json["popularity"].toDouble(),
        mediaType: json["media_type"],
      );

  Map<String, dynamic> toJson() => {
        "vote_average": voteAverage ?? 0,
        "title": title ?? '',
        "overview": overview ?? '',
        "release_date": releaseDate ?? '',
        "adult": adult ?? false,
        "backdrop_path": backdropPath ?? '',
        "genre_ids": List<int>.from(genres!.map((x) => x)).toList(),
        "vote_count": voteCount ?? 0,
        "original_language": originalLanguage ?? '',
        "original_title": originalTitle ?? '',
        "poster_path": posterPath ?? '',
        "id": id ?? 0,
        "video": video ?? false,
        "popularity": popularity ?? 0,
        "media_type": mediaType ?? false,
      };
}

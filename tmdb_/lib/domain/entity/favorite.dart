import 'package:equatable/equatable.dart';

import 'package:damovie/data/models/favorite_model.dart';
import 'package:damovie/domain/entity/genre.dart';

class FavoriteEntity extends Equatable {
  final int? id;
  final String? title;
  final String? overview;
  final double? average;
  final List<int>? genresId;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final String? originalTitle;
  final int? voteCount;
  FavoriteEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.average,
    required this.genresId,
    required this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.originalTitle,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        average,
        genresId,
        posterPath,
      ];
}

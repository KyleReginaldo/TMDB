import '../../domain/entity/cast_entity.dart';

class Cast {
  Cast({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<CastModel> cast;
  final List<CastModel> crew;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["id"],
        cast: List<CastModel>.from(
            json["cast"].map((x) => CastModel.fromJson(x))),
        crew: List<CastModel>.from(
            json["crew"].map((x) => CastModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class CastModel extends CastEntity {
  const CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.job,
  }) : super(
          creditId: creditId,
          name: name,
          posterPath: profilePath,
          character: character,
        );

  final bool adult;
  final int gender;
  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;
  final String job;

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json["adult"] ?? '',
        gender: json["gender"] ?? '',
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        originalName: json["original_name"] ?? '',
        popularity: json["popularity"].toDouble() ?? 0,
        profilePath: json["profile_path"] ?? '',
        castId: json["cast_id"] ?? 0,
        character: json["character"] ?? '',
        creditId: json["credit_id"] ?? '',
        order: json["order"] ?? 0,
        job: json["job"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "job": job
      };
}

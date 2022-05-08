import 'package:damovie/domain/entity/video_entity.dart';

class VideoModel extends VideoEntity {
  final String iso_639_1;
  final String iso_3166_1;
  final String name;

  final String site;
  final int size;
  final bool official;
  final String publishedAt;
  final String id;
  VideoModel({
    required String key,
    required String type,
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.site,
    required this.size,
    required this.official,
    required this.publishedAt,
    required this.id,
  }) : super(
          key: key,
          type: type,
          title: name,
        );
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      iso_639_1: json['iso_639_1'],
      iso_3166_1: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso_639_1,
        'iso_3166_1': iso_3166_1,
        'name': name,
        'key': key,
        'site': site,
        'size': size,
        'type': type,
        'official': official,
        'published_at': publishedAt,
        'id': id,
      };
}

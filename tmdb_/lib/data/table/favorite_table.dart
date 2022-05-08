import 'package:damovie/domain/entity/favorite.dart';
import 'package:hive/hive.dart';
part 'favorite_table.g.dart';

@HiveType(typeId: 0)
class FavoriteTable extends FavoriteEntity {
  FavoriteTable({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String posterPath,
  }) : super(
          id: id,
          title: title,
          posterPath: posterPath,
          overview: '',
          average: 0,
          genresId: [],
        );

  factory FavoriteTable.fromFavoriteEntity(FavoriteEntity favorite) {
    return FavoriteTable(
      id: favorite.id!,
      title: favorite.title!,
      posterPath: favorite.posterPath!,
    );
  }
  factory FavoriteTable.fromMap(Map<String, dynamic> map) {
    return FavoriteTable(
        id: map['id'], title: map['title'], posterPath: map['poster_path']);
  }
}

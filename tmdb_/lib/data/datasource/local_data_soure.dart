import 'package:hive/hive.dart';

import '../table/favorite_table.dart';

abstract class LocalDataSource {
  // Future<void> getFavorites()
  Future<List<FavoriteTable>> getFavorites();
  Future<void> addFavorite(FavoriteTable favorite);
  Future<void> deleteFavorite({required int id});
}

class LocalDataSourceImpl implements LocalDataSource {
  final box = Hive.box('favorites');
  @override
  Future<void> addFavorite(FavoriteTable favorite) async {
    await box.put(favorite.id, favorite);
  }

  @override
  Future<void> deleteFavorite({required int id}) async {
    await box.delete(id);
  }

  @override
  Future<List<FavoriteTable>> getFavorites() async {
    var cachedFavorite = box.values.toList();
    final convertedTable = cachedFavorite.map((table) {
      print(table);
      return table as FavoriteTable;
    }).toList();
    return convertedTable;
  }
}

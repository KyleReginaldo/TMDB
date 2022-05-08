import 'package:hive/hive.dart';

final favoritesStorage = Hive.box('favorites');
bool favoriteFilter(int id) => favoritesStorage.containsKey(id);

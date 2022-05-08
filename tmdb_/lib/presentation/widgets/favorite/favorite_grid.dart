import 'package:damovie/domain/entity/favorite.dart';
import 'package:damovie/presentation/widgets/favorite/favorite_card.dart';
import 'package:flutter/material.dart';

class FavoriteGrid extends StatelessWidget {
  final List<FavoriteEntity> favorites;
  const FavoriteGrid({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return FavoriteCard(movie: favorites[index]);
          }),
    );
  }
}

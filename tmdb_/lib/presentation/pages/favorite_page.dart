import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:damovie/presentation/widgets/linear_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/design/colors.dart';
import '../widgets/favorite/favorite_grid.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GREY20,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: DARKGREY.withOpacity(0.6),
        title: const CustomOswaldText(
          text: 'Favorites',
          color: WHITE,
        ),
        centerTitle: true,
      ),
      body:
          BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
        if (state is Loaded) {
          return FavoriteGrid(favorites: state.movies);
        } else if (state is Error) {
          return CustomOswaldText(
            text: state.msg,
            color: GREY,
          );
        } else if (state is Loading) {
          return const LinearProgressIndicatorWidget();
        }
        return const SizedBox.shrink();
      }),
    );
  }
}

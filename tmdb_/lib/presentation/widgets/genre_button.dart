import 'package:damovie/core/design/colors.dart';
import 'package:damovie/presentation/cubit/choose_genre_cubit/choose_genre_cubit.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/genre_filt.dart';

class GenreButton extends StatelessWidget {
  const GenreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (int id) =>
          BlocProvider.of<ChooseGenreCubit>(context).chooseGenre(id: id),
      child: const Icon(Icons.arrow_drop_down_outlined),
      itemBuilder: (context) {
        return genreList
            .map(
              (genre) => PopupMenuItem(
                child: CustomOswaldText(
                  text: genre.name!,
                  color: WHITE,
                ),
                value: genre.id,
              ),
            )
            .toList();
      },
      color: DARKGREY,
    );
  }
}

import '../../../core/design/colors.dart';
import 'custom_oswald_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/api_constants.dart';
import '../../../domain/entity/movie_entity.dart';
import 'bottom_sheet.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({Key? key, required this.movies}) : super(key: key);
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: movies.map((movie) {
            return InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheetBuilder(movie: movie),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '$BASE_IMAG_URL${movie.posterPath}',
                    loadingBuilder: ((context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CustomOswaldText(
                          text: '${movie.title}',
                          color: GREY,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

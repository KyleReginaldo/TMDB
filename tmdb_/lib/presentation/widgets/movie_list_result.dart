import '../cubit/movie_detail_cubit/get_movie_detail_cubit.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/movie_entity.dart';
import '../pages/detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/api_constants.dart';
import '../../core/design/colors.dart';
import '../../dipendency_injection.dart';
import 'home/custom_oswald_text.dart';

class MovieListResult extends StatefulWidget {
  final MovieEntity movie;
  const MovieListResult({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieListResult> createState() => _MovieListResultState();
}

class _MovieListResultState extends State<MovieListResult> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toDetails(int id) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BlocProvider.value(
          value: sl<GetMovieDetailCubit>(),
          child: DetailPage(
            id: id,
            movie: widget.movie,
          ),
        );
      }));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            DARKGREY,
            DARKRED,
            RED,
            BLACK,
          ],
        ),
      ),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: InkWell(
        onTap: () {
          toDetails(widget.movie.id!);
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.network(
                      widget.movie.posterPath != null
                          ? '$BASE_IMAG_URL${widget.movie.posterPath}'
                          : NO_IMAGE_LINK,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                  child: CustomOswaldText(
                    text: widget.movie.title!,
                    color: WHITE,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            CustomOswaldText(
              text: widget.movie.overview!,
              color: GREY,
              overflow: TextOverflow.fade,
              maxlines: 3,
            )
          ],
        ),
      ),
    );
  }
}

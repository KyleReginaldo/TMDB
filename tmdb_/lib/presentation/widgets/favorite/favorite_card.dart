import 'package:damovie/core/design/colors.dart';
import 'package:damovie/core/utils/favorite_filter.dart';
import 'package:damovie/domain/entity/movie_entity.dart';
import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/cubit/movie_detail_cubit/get_movie_detail_cubit.dart';
import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';
import 'package:damovie/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/api_constants.dart';
import '../../../dipendency_injection.dart';
import '../../../domain/entity/favorite.dart';
import '../../cubit/favorite_cubit/favorite_cubit.dart';

class FavoriteCard extends StatefulWidget {
  final FavoriteEntity movie;
  const FavoriteCard({Key? key, required this.movie}) : super(key: key);

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider<GetMovieDetailCubit>(
                        create: (context) => sl<GetMovieDetailCubit>()
                          ..getMovieDetail(id: widget.movie.id!),
                      ),
                      BlocProvider<FavoriteCubit>(
                        create: (context) => sl<FavoriteCubit>(),
                      ),
                      BlocProvider<VideoCubit>(
                        create: (context) =>
                            sl<VideoCubit>()..getVideo(widget.movie.id!),
                      ),
                      BlocProvider<CastCubit>(
                        create: (context) =>
                            sl<CastCubit>()..getCast(widget.movie.id!),
                      ),
                    ],
                    child: DetailPage(
                      id: widget.movie.id!,
                      movie: MovieEntity.fromFavorite(widget.movie),
                    ),
                  ),
                ),
              ),
              child: Image.network(
                '$BASE_IMAG_URL${widget.movie.posterPath}',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: favoriteFilter(widget.movie.id!)
                  ? InkWell(
                      onTap: () {
                        context
                            .read<FavoriteCubit>()
                            .deleteFavorite(widget.movie.id!);
                        setState(() {});
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.favorite,
                          color: WHITE,
                          size: 28,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        context
                            .read<FavoriteCubit>()
                            .addFavorites(widget.movie);
                        setState(() {});
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.favorite_border,
                          color: WHITE,
                          size: 28,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

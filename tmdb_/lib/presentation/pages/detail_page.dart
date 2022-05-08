import 'package:damovie/domain/entity/movie_entity.dart';
import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/widgets/cast_widget.dart';
import 'package:damovie/presentation/widgets/movie_detail_appbar.dart';
import 'package:damovie/presentation/widgets/videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import '../../core/constants/api_constants.dart';
import '../../core/design/colors.dart';
import '../../core/utils/favorite_filter.dart';
import '../../data/models/favorite_model.dart';
import '../cubit/favorite_cubit/favorite_cubit.dart';
import '../cubit/movie_detail_cubit/get_movie_detail_cubit.dart';
import '../widgets/home/custom_oswald_text.dart';
import '../widgets/linear_progress_indicator.dart';

class DetailPage extends StatefulWidget {
  final int id;
  final MovieEntity movie;

  const DetailPage({
    Key? key,
    required this.id,
    required this.movie,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetMovieDetailCubit, GetMovieDetailState>(
            builder: (context, state) {
          if (state is GetMovieDetailLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: BLACK,
                          image: DecorationImage(
                            image: NetworkImage(
                              state.movieDetail.backdropPath.isNotEmpty
                                  ? BASE_IMAG_URL +
                                      state.movieDetail.backdropPath
                                  : NO_IMAGE_LINK,
                            ),
                            opacity: 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        bottom: 34,
                        child: SmoothStarRating(
                          allowHalfRating: false,
                          rating: state.movieDetail.voteAverage / 2,
                          color: Colors.amber,
                          size: 25,
                          borderColor: Colors.amber.shade700,
                          spacing: 0.0,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Container(
                          color: DARKGREY,
                          child: CustomOswaldText(
                            text: state.movieDetail.tagline,
                            color: WHITE,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 30,
                              color: WHITE,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: favoriteFilter(widget.movie.id!)
                              ? IconButton(
                                  onPressed: () {
                                    context
                                        .read<FavoriteCubit>()
                                        .deleteFavorite(widget.movie.id!);
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: WHITE,
                                    size: 30,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    context.read<FavoriteCubit>().addFavorites(
                                          FavoriteModel(
                                            id: widget.movie.id ?? 0,
                                            title: widget.movie.title ?? '',
                                            overview:
                                                widget.movie.overview ?? '',
                                            average:
                                                widget.movie.voteAverage ?? 0,
                                            genresId: widget.movie.genres ?? [],
                                            posterPath:
                                                widget.movie.posterPath ?? '',
                                          ),
                                        );
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: WHITE,
                                    size: 30,
                                  ),
                                ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: CustomOswaldText(
                      text: state.movieDetail.title,
                      color: WHITE,
                      fontSize: 25,
                      weight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        CustomOswaldText(
                          text:
                              '${DateTime.parse(state.movieDetail.releaseDate).year}',
                          color: GREY,
                          weight: FontWeight.w300,
                        ),
                        const SizedBox(width: 8),
                        CustomOswaldText(
                          text: state.movieDetail.adult ? '18+' : '13+',
                          color: WHITE,
                          bgColor: DARKGREY,
                        ),
                        const SizedBox(width: 8),
                        CustomOswaldText(
                          text: '${state.movieDetail.runtime}m',
                          color: GREY,
                          weight: FontWeight.w300,
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: state.movieDetail.genres.map((genre) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: CustomOswaldText(
                                text: genre.name!,
                                color: WHITE,
                                bgColor: TEAL,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 10),
                    child: CustomOswaldText(
                      text: 'OVERVIEW',
                      color: WHITE,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomOswaldText(
                      text: state.movieDetail.overview,
                      color: GREY,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const CastWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 80,
                      ),
                      VideosWidget(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          } else if (state is GetMovieDetailLoading) {
            return Container(
              alignment: Alignment.topCenter,
              child: const LinearProgressIndicatorWidget(),
              height: 250,
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}

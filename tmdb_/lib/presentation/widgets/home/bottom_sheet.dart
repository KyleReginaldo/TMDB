import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';
import 'package:damovie/presentation/widgets/videos/watch_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/design/colors.dart';
import '../../../dipendency_injection.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../cubit/movie_detail_cubit/get_movie_detail_cubit.dart';
import '../../pages/detail_page.dart';
import 'custom_oswald_text.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class BottomSheetBuilder extends StatefulWidget {
  const BottomSheetBuilder({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieEntity movie;

  @override
  State<BottomSheetBuilder> createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {
  void toDetailScreen(int id) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<GetMovieDetailCubit>(
                create: (context) =>
                    sl<GetMovieDetailCubit>()..getMovieDetail(id: id),
              ),
              BlocProvider<FavoriteCubit>(
                create: (context) => sl<FavoriteCubit>(),
              ),
              BlocProvider<VideoCubit>(
                create: (context) => sl<VideoCubit>()..getVideo(id),
              ),
              BlocProvider<CastCubit>(
                create: (context) => sl<CastCubit>()..getCast(id),
              ),
            ],
            child: DetailPage(
              id: id,
              movie: widget.movie,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '$BASE_IMAG_URL${widget.movie.backdropPath}',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            '$BASE_IMAG_URL${widget.movie.posterPath}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomOswaldText(
                                text: widget.movie.title!,
                                fontSize: 18,
                                color: WHITE,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomOswaldText(
                                text:
                                    '${DateTime.tryParse(widget.movie.releaseDate!)?.year.toString() ?? ''}-${DateTime.tryParse(widget.movie.releaseDate!)?.month.toString() ?? ''}',
                                color: WHITE,
                                weight: FontWeight.w200,
                              ),
                              SmoothStarRating(
                                allowHalfRating: false,
                                rating: widget.movie.voteAverage! / 2,
                                color: Colors.amber,
                                size: 15,
                                borderColor: Colors.amber.shade700,
                                spacing: 0.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 130,
                    bottom: 15,
                    child: InkWell(
                      onTap: () {
                        toDetailScreen(widget.movie.id!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                TEAL,
                                GREEN,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        width: 60,
                        height: 25,
                        child: const Center(
                          child: CustomOswaldText(
                            text: 'Details',
                            color: WHITE,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 200,
                    bottom: 15,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: sl<VideoCubit>()
                                ..getVideo(widget.movie.id!),
                              child: BlocBuilder<VideoCubit, VideoState>(
                                builder: (context, state) {
                                  if (state is VideoLoaded) {
                                    return WatchVideo(videos: state.videos);
                                  }
                                  return Container();
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                TEAL,
                                GREEN,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        width: 60,
                        height: 25,
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: WHITE,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: CustomOswaldText(
                text: widget.movie.overview!,
                color: Colors.white,
                weight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
      height: 350,
    );
  }
}

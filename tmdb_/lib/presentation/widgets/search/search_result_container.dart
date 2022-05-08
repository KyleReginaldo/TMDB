import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/design/colors.dart';
import '../../pages/detail_page.dart';
import '../home/custom_oswald_text.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/movie_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../dipendency_injection.dart';
import '../../cubit/movie_detail_cubit/get_movie_detail_cubit.dart';

class ResultContainer extends StatefulWidget {
  final List<MovieEntity> movies;
  const ResultContainer({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  State<ResultContainer> createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.movies.map((movie) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider<GetMovieDetailCubit>(
                        create: (context) => sl<GetMovieDetailCubit>()
                          ..getMovieDetail(id: movie.id!),
                      ),
                      BlocProvider<FavoriteCubit>(
                        create: (context) => sl<FavoriteCubit>(),
                      ),
                      BlocProvider<VideoCubit>(
                        create: (context) =>
                            sl<VideoCubit>()..getVideo(movie.id!),
                      ),
                      BlocProvider<CastCubit>(
                        create: (context) =>
                            sl<CastCubit>()..getCast(movie.id!),
                      ),
                    ],
                    child: DetailPage(
                      id: movie.id!,
                      movie: movie,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    TEAL,
                    GREEN,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie.posterPath != null
                            ? '$BASE_IMAG_URL${movie.posterPath}'
                            : NO_IMAGE_LINK,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomOswaldText(
                          text: movie.title ?? '',
                          color: WHITE,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 105,
                            child: CustomOswaldText(
                              text: movie.overview!,
                              color: GREY,
                              fontSize: 12,
                              maxlines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Row(
                            children: [
                              CustomOswaldText(
                                text: movie.releaseDate ?? '',
                                color: GREY,
                                fontSize: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Iconify(
                                  Ic.baseline_star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: CustomOswaldText(
                                  text: movie.voteAverage.toString(),
                                  color: WHITE,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

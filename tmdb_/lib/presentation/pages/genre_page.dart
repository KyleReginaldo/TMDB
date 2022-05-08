import 'package:damovie/core/design/colors.dart';
import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/cubit/choose_genre_cubit/choose_genre_cubit.dart';
import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';
import 'package:damovie/presentation/widgets/genre_button.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:damovie/presentation/widgets/linear_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/api_constants.dart';
import '../../dipendency_injection.dart';
import '../cubit/movie_detail_cubit/get_movie_detail_cubit.dart';
import 'detail_page.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  void initState() {
    context.read<ChooseGenreCubit>().chooseGenre(id: 28);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GREY8,
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          width: 50,
          child: Image.asset(
            'assets/images/tmdb.png',
            fit: BoxFit.fill,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
          ),
        ),
        backgroundColor: BLACK.withOpacity(0.5),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 6),
            child: GenreButton(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ChooseGenreCubit, ChooseGenreState>(
                builder: (context, state) {
              if (state is GenreLoaded) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            child: Image.network(
                                '$BASE_IMAG_URL${state.movies[0].backdropPath}'),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: BLACK.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: MediaQuery.of(context).size.width - 108,
                              child: CustomOswaldText(
                                text: state.movies[0].overview!,
                                color: WHITE_SMOKE,
                                overflow: TextOverflow.fade,
                                maxlines: 3,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: state.movies.map((movie) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider<GetMovieDetailCubit>(
                                            create: (context) =>
                                                sl<GetMovieDetailCubit>()
                                                  ..getMovieDetail(
                                                      id: movie.id!),
                                          ),
                                          BlocProvider<FavoriteCubit>(
                                            create: (context) =>
                                                sl<FavoriteCubit>(),
                                          ),
                                          BlocProvider<VideoCubit>(
                                            create: (context) =>
                                                sl<VideoCubit>()
                                                  ..getVideo(movie.id!),
                                          ),
                                          BlocProvider<CastCubit>(
                                            create: (context) => sl<CastCubit>()
                                              ..getCast(movie.id!),
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
                                child: SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      movie.posterPath != null
                                          ? '$BASE_IMAG_URL${movie.posterPath}'
                                          : NO_IMAGE_LINK,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is GenreLoading) {
                return const LinearProgressIndicatorWidget();
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

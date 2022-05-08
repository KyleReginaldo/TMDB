import '../../cubit/now_playing_cubit/now_playing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_horizontal_list.dart';

class NowPlayingContainer extends StatefulWidget {
  const NowPlayingContainer({Key? key}) : super(key: key);

  @override
  State<NowPlayingContainer> createState() => _NowPlayingContainerState();
}

class _NowPlayingContainerState extends State<NowPlayingContainer> {
  @override
  void initState() {
    context.read<NowPlayingCubit>().getNowPlaying();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: ((context, state) {
        if (state is NowPlayingLoaded) {
          return MovieHorizontalList(
            movies: state.movies,
          );
        }
        if (state is NowPlayingLoading) {
          return Container(
            height: 150,
          );
        }
        if (state is NowPlayingError) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}

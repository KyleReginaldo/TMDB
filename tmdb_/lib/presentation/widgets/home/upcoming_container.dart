import '../../cubit/upcoming_cubit/upcoming_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_horizontal_list.dart';

class UpcomingContainer extends StatefulWidget {
  const UpcomingContainer({Key? key}) : super(key: key);

  @override
  State<UpcomingContainer> createState() => _UpcomingContainerState();
}

class _UpcomingContainerState extends State<UpcomingContainer> {
  @override
  void initState() {
    context.read<UpcomingCubit>().getUpComing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: ((context, state) {
        if (state is UpcomingLoaded) {
          return MovieHorizontalList(
            movies: state.movies,
          );
        }
        if (state is UpcomingLoading) {
          return Container(
            height: 150,
          );
        }
        if (state is UpcomingError) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}

import 'movie_horizontal_list.dart';

import '../../cubit/trending_cubit/trending_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingCubit>().getTrending();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCubit, TrendingState>(
        builder: ((context, state) {
      if (state is TrendingLoaded) {
        return MovieHorizontalList(
          movies: state.movies,
        );
      } else if (state is TrendingLoading) {
        return Container(
          height: 150,
        );
      } else if (state is TrendingError) {
        return Center(
          child: Container(
            child: Text(
              state.error,
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    }));
  }
}

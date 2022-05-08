import '../../core/design/colors.dart';
import '../cubit/search/search_cubit.dart';
import '../widgets/home/custom_oswald_text.dart';
import '../widgets/linear_progress_indicator.dart';
import '../widgets/search/search_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/search/search_result_container.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchCubit>().searchMovies(
          query: 'a',
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BLACK,
        body: Column(
          children: [
            const SearchWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: BlocConsumer<SearchCubit, SearchState>(
                    listener: (context, state) {
                  if (state is SearchLoading) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: CustomOswaldText(
                          text: 'Loading...',
                          color: GREY,
                        ),
                      ),
                    );
                  }
                }, builder: (context, state) {
                  if (state is SearchEmpty) {
                    return Center(
                      child: CustomOswaldText(
                        text: state.msg,
                        color: GREY,
                        fontSize: 30,
                        weight: FontWeight.w400,
                      ),
                    );
                  } else if (state is SearchLoading) {
                    return const LinearProgressIndicatorWidget();
                  } else if (state is SearchLoaded) {
                    return ResultContainer(
                      movies: state.movies,
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: CustomOswaldText(
                        text: state.error,
                        color: GREY,
                        fontSize: 30,
                        weight: FontWeight.w400,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

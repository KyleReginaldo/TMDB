import '../linear_progress_indicator.dart';

import '../../../core/design/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../core/constants/api_constants.dart';
import '../../cubit/popular_cubit/popular_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_sheet.dart';
import 'custom_oswald_text.dart';

class PopularContainerWidget extends StatefulWidget {
  const PopularContainerWidget({Key? key}) : super(key: key);

  @override
  State<PopularContainerWidget> createState() => _PopularContainerWidgetState();
}

class _PopularContainerWidgetState extends State<PopularContainerWidget> {
  @override
  void initState() {
    context.read<PopularCubit>().getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<PopularCubit, PopularState>(builder: ((context, state) {
      if (state is PopularLoaded) {
        return SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => showModalBottomSheet(
                    enableDrag: true,
                    context: context,
                    builder: (context) =>
                        BottomSheetBuilder(movie: state.movies[index])),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '$BASE_IMAG_URL${state.movies[index].backdropPath}'),
                      opacity: 0.8,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  width: width,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                          left: 18,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 25,
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        CustomOswaldText(
                                          text: state.movies[index].title!,
                                          color: WHITE,
                                          weight: FontWeight.bold,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(width: 6),
                                        CustomOswaldText(
                                          text:
                                              "${DateTime.tryParse(state.movies[index].releaseDate!)?.year ?? ''}",
                                          color: WHITE,
                                          fontSize: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 18,
                                child: CustomOswaldText(
                                  text: state.movies[index].overview!,
                                  color: WHITE,
                                  weight: FontWeight.w300,
                                  maxlines: 3,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is PopularLoading) {
        return Container(
          alignment: Alignment.topCenter,
          child: const LinearProgressIndicatorWidget(),
          height: 250,
        );
      } else if (state is PopularError) {
        return Container();
      }
      return const SizedBox.shrink();
    }));
  }
}

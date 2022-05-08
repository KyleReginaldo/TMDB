import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/api_constants.dart';
import '../../core/design/colors.dart';
import '../cubit/cast_cubit/cast_cubit.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          final cast = state.cast;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: cast.map((cast) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    CustomOswaldText(
                      text: cast.name,
                      color: WHITE,
                      fontSize: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            cast.posterPath.isNotEmpty
                                ? '$BASE_IMAG_URL${cast.posterPath}'
                                : NO_IMAGE_LINK,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList()),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

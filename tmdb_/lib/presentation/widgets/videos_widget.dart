import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:damovie/presentation/widgets/videos/watch_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/design/colors.dart';
import '../../dipendency_injection.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: sl<VideoCubit>(),
                    child: WatchVideo(videos: _videos),
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
                    GREY8,
                    GREEN,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              height: 40,
              width: 200,
              child: const Center(
                  child: CustomOswaldText(text: 'Watch Trailer', color: WHITE)),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

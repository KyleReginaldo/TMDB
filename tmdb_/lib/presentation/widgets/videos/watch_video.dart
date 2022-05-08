import 'package:cached_network_image/cached_network_image.dart';
import 'package:damovie/core/constants/api_constants.dart';
import 'package:damovie/presentation/widgets/home/custom_oswald_text.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:damovie/domain/entity/video_entity.dart';
import '../../../core/design/colors.dart';

class WatchVideo extends StatefulWidget {
  final List<VideoEntity> videos;
  const WatchVideo({
    Key? key,
    required this.videos,
  }) : super(key: key);

  @override
  State<WatchVideo> createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  late YoutubePlayerController ytController;

  @override
  void initState() {
    super.initState();
    ytController = YoutubePlayerController(
        initialVideoId: widget.videos[0].key,
        flags: const YoutubePlayerFlags());
  }

  @override
  void dispose() {
    ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DARKGREY.withOpacity(0.2),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: ytController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: ALICE_BLUE,
          progressColors: const ProgressBarColors(
            playedColor: WHITE,
            handleColor: TEAL,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < widget.videos.length; i++)
                        Container(
                          width: width,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ytController.load(widget.videos[i].key);
                                  ytController.play();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: CachedNetworkImage(
                                    width: 150,
                                    imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: widget.videos[i].key,
                                      quality: ThumbnailQuality.high,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomOswaldText(
                                    text: widget.videos[i].title,
                                    color: WHITE,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

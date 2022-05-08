import 'package:flutter/material.dart';

import '../widgets/home/custom_oswald_text.dart';
import '../widgets/home/nowplaying_container_widget.dart';
import '../widgets/home/popular_container_widget.dart';
import '../widgets/home/trending_widget.dart';
import '../widgets/home/upcoming_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FractionallySizedBox(
            child: PopularContainerWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              top: 8,
            ),
            child: CustomOswaldText(
              text: 'Now Playing',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            child: NowPlayingContainer(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              top: 8,
            ),
            child: CustomOswaldText(
              text: 'Trending',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            child: TrendingWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              top: 8,
            ),
            child: CustomOswaldText(
              text: 'Up Coming',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            child: UpcomingContainer(),
          ),
        ],
      ),
    );
  }
}

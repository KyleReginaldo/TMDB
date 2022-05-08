import 'package:damovie/data/datasource/remote_data_source.dart';
import 'package:damovie/data/table/favorite_table.dart';
import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/cubit/choose_genre_cubit/choose_genre_cubit.dart';
import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'presentation/cubit/home_cubit/home_cubit.dart';
import 'presentation/cubit/search/search_cubit.dart';

import 'presentation/cubit/movie_detail_cubit/get_movie_detail_cubit.dart';
import 'core/design/colors.dart';
import 'presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import 'presentation/cubit/upcoming_cubit/upcoming_cubit.dart';
import 'presentation/cubit/popular_cubit/popular_cubit.dart';
import 'presentation/cubit/trending_cubit/trending_cubit.dart';
import 'presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dipendency_injection.dart' as di;
import 'dipendency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(FavoriteTableAdapter());
  await Hive.openBox('favorites');
  runApp(const DaMovie());
}

class DaMovie extends StatelessWidget {
  const DaMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: BLACK,
          ),
          scaffoldBackgroundColor: BLACK,
        ),
        title: 'Da Movie',
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TrendingCubit>(
              create: (context) => sl<TrendingCubit>(),
            ),
            BlocProvider<PopularCubit>(
              create: (context) => sl<PopularCubit>(),
            ),
            BlocProvider<NowPlayingCubit>(
              create: (context) => sl<NowPlayingCubit>(),
            ),
            BlocProvider<UpcomingCubit>(
              create: (context) => sl<UpcomingCubit>(),
            ),
            BlocProvider<GetMovieDetailCubit>(
              create: (context) => sl<GetMovieDetailCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<HomeCubit>(),
            ),
            BlocProvider<SearchCubit>(
              create: (context) => sl<SearchCubit>(),
            ),
            BlocProvider<ChooseGenreCubit>(
              create: (context) => sl<ChooseGenreCubit>(),
            ),
            BlocProvider<FavoriteCubit>(
              create: (context) => sl<FavoriteCubit>(),
            ),
            BlocProvider<VideoCubit>(
              create: (context) => sl<VideoCubit>(),
            ),
            BlocProvider<CastCubit>(
              create: (context) => sl<CastCubit>(),
            ),
          ],
          child: const MainPage(),
        ));
  }
}

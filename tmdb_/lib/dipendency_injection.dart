import 'package:damovie/data/datasource/local_data_soure.dart';
import 'package:damovie/domain/usecase/add_fav.dart';
import 'package:damovie/domain/usecase/choose_genre.dart';
import 'package:damovie/domain/usecase/delete_fav.dart';
import 'package:damovie/domain/usecase/get_cast.dart';
import 'package:damovie/domain/usecase/get_favorites.dart';
import 'package:damovie/domain/usecase/get_genre.dart';
import 'package:damovie/domain/usecase/get_video.dart';
import 'package:damovie/presentation/cubit/cast_cubit/cast_cubit.dart';
import 'package:damovie/presentation/cubit/choose_genre_cubit/choose_genre_cubit.dart';
import 'package:damovie/presentation/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:damovie/presentation/cubit/video_cubit/video_cubit.dart';

import 'domain/usecase/search_movies.dart';
import 'presentation/cubit/home_cubit/home_cubit.dart';
import 'presentation/cubit/search/search_cubit.dart';

import 'domain/usecase/get_movie_detail.dart';
import 'presentation/cubit/movie_detail_cubit/get_movie_detail_cubit.dart';

import 'domain/usecase/get_up_coming.dart';
import 'domain/usecase/now_playin.dart';
import 'presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import 'presentation/cubit/upcoming_cubit/upcoming_cubit.dart';

import 'data/datasource/remote_data_source.dart';
import 'data/repository/movie_repository_impl.dart';
import 'domain/repository/movie_repository.dart';
import 'domain/usecase/get_popular.dart';
import 'domain/usecase/get_trending.dart';
import 'presentation/cubit/popular_cubit/popular_cubit.dart';
import 'presentation/cubit/trending_cubit/trending_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future init() async {
  //**cubit */

  sl.registerFactory(() => CastCubit(sl()));
  sl.registerFactory(() => VideoCubit(sl()));
  sl.registerFactory(() => TrendingCubit(sl()));
  sl.registerFactory(() => PopularCubit(sl()));
  sl.registerFactory(() => NowPlayingCubit(sl()));
  sl.registerFactory(() => UpcomingCubit(sl()));
  sl.registerFactory(
      () => GetMovieDetailCubit(getMovieDetails: sl(), video: sl()));
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => SearchCubit(sl()));
  sl.registerFactory(() => ChooseGenreCubit(sl()));
  sl.registerFactory(
    () => FavoriteCubit(
      sl(),
      sl(),
      sl(),
    ),
  );

  //**usecases */
  sl.registerLazySingleton(() => GetCast(repo: sl()));
  sl.registerLazySingleton(() => GetVideo(repo: sl()));
  sl.registerLazySingleton(() => AddFavorite(repo: sl()));
  sl.registerLazySingleton(() => DeleteFavorite(repo: sl()));
  sl.registerLazySingleton(() => GetFavorites(repo: sl()));
  sl.registerLazySingleton(() => GetNowPlaying(repo: sl()));
  sl.registerLazySingleton(() => GetPopular(repo: sl()));
  sl.registerLazySingleton(() => GetTrending(repo: sl()));
  sl.registerLazySingleton(() => GetUpComing(repo: sl()));
  sl.registerLazySingleton(() => GetMovieDetail(repo: sl()));
  sl.registerLazySingleton(() => SearchMovies(repo: sl()));
  sl.registerLazySingleton(() => GetGenres(repo: sl()));
  sl.registerLazySingleton(() => ChooseGenre(repo: sl()));

  //!repo
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remote: sl(), local: sl()));

  //!datasource
  sl.registerLazySingleton<RemoteDataSource>(() => RemotedataSourceImpl());
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}

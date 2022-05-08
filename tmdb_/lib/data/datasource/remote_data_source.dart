import 'dart:convert';

import 'package:damovie/data/models/cast_model.dart';
import 'package:damovie/data/models/genre_model.dart';
import 'package:damovie/data/models/video_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';
import '../../core/errors/Exception/server_exception.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

abstract class RemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getUpComing();
  Future<MovieDetailsModel> getSpecMovie({
    required int id,
  });
  Future<List<MovieModel>> searchMovies({
    required String query,
  });
  Future<List<GenreModel>> getGenre();
  Future<List<MovieModel>> chooseGenre({required int genreid});
  Future<List<VideoModel>> fetchVideos(int id);
  Future<List<CastModel>> getCast(int id);
}

class RemotedataSourceImpl implements RemoteDataSource {
  @override
  Future<List<MovieModel>> getTrending() async {
    return getMovies('${BASE_URL}trending/movie/day?api_key=$API_KEY');
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    return getMovies('${BASE_URL}movie/popular?api_key=$API_KEY');
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    return getMovies('${BASE_URL}movie/now_playing?api_key=$API_KEY');
  }

  @override
  Future<List<MovieModel>> getUpComing() async {
    return getMovies('${BASE_URL}movie/upcoming?api_key=$API_KEY');
  }

  @override
  Future<MovieDetailsModel> getSpecMovie({required int id}) async {
    final response = await http.get(
        Uri.parse('${BASE_URL}movie/$id?api_key=$API_KEY'),
        headers: {'Content-Type': 'application/json'});
    final rawData = json.decode(response.body);
    print(rawData);
    return response.statusCode == 200
        ? MovieDetailsModel.fromJson(rawData)
        : throw ServerException();
  }

  @override
  Future<List<MovieModel>> searchMovies({required String query}) async {
    List<MovieModel> movies = [];
    final response = await http.get(
        Uri.parse('${BASE_URL}search/movie?api_key=$API_KEY&query=$query'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final rawData = json.decode(response.body);
      rawData['results'].forEach((map) {
        print('result: ${map}');
        movies.add(MovieModel.fromJson(map));
      });
      return movies;
    } else {
      throw ServerException();
    }
  }

  Future<List<MovieModel>> getMovies(String url) async {
    List<MovieModel> movies = [];
    final response = await http
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final rawData = json.decode(response.body);
      rawData['results'].forEach((map) {
        movies.add(MovieModel.fromJson(map));
      });
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<GenreModel>> getGenre() async {
    List<GenreModel> genres = [];
    final response = await http.get(
        Uri.parse(
            '${BASE_URL}genre/movie/list?api_key=$API_KEY&language=en-US'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
      final rawData = json.decode(response.body);
      rawData['genres'].forEach((map) {
        genres.add(GenreModel.fromJson(map));
      });
      return genres;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> chooseGenre({required int genreid}) async {
    List<MovieModel> movies = [];
    final response = await http.get(
        Uri.parse(
            '${BASE_URL}discover/movie?api_key=$API_KEY&with_genres=$genreid'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
      final rawData = json.decode(response.body);
      rawData['results'].forEach((map) {
        movies.add(MovieModel.fromJson(map));
      });
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<VideoModel>> fetchVideos(int id) async {
    List<VideoModel> videos = [];
    final response = await http.get(
        Uri.parse('${BASE_URL}movie/$id/videos?api_key=$API_KEY'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final rawVideos = json.decode(response.body);
      rawVideos['results'].forEach((mapResult) {
        print("videos$mapResult");
        videos.add(VideoModel.fromJson(mapResult));
      });
      return videos;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CastModel>> getCast(int id) async {
    List<CastModel> casts = [];
    final response = await http.get(
        Uri.parse('${BASE_URL}movie/$id/credits?api_key=$API_KEY'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final rawData = json.decode(response.body);
      rawData['cast'].forEach((cast) {
        print('cast://$cast');
        casts.add(CastModel.fromJson(cast));
      });
      return casts;
    } else {
      throw ServerException();
    }
  }
}

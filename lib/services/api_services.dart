import 'dart:async';
import 'package:dio/dio.dart';
import 'package:moviestar/constant/app_constant.dart';
import 'package:moviestar/models/movie_model.dart';
import 'package:moviestar/models/tv_shows_model.dart';

class ApiServices {
  Dio dio = Dio();
  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final response = await dio
          .get(AppConstant.TRENDING_MOVIES,
              options: Options(headers: {'Accept': 'application/json'}))
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw TimeoutException("Connection time out"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['results'];
        List<MovieModel> trendings =
            List<MovieModel>.from(data.map((e) => MovieModel.fromJson(e)));
        return trendings;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await dio
          .get(AppConstant.POPULAR_MOVIES,
              options: Options(headers: {'Accept': 'application/json'}))
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw TimeoutException("Connection time out"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['results'];
        List<MovieModel> populars =
            List<MovieModel>.from(data.map((e) => MovieModel.fromJson(e)));
        return populars;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await dio
          .get(AppConstant.NOW_PLAYING_MOVIES,
              options: Options(headers: {'Accept': 'application/json'}))
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw TimeoutException("Connection time out"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['results'];
        List<MovieModel> nowPlaying =
            List<MovieModel>.from(data.map((e) => MovieModel.fromJson(e)));
        return nowPlaying;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await dio
          .get(AppConstant.TOP_RATED_MOVIES,
              options: Options(headers: {'Accept': 'application/json'}))
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw TimeoutException("Connection time out"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['results'];
        List<MovieModel> topRated =
            List<MovieModel>.from(data.map((e) => MovieModel.fromJson(e)));
        return topRated;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TvShowsModel>> getTopRatedTvShows() async {
    try {
      final response = await dio
          .get(AppConstant.TOP_RATED_TV_SHOWS,
              options: Options(headers: {'Accept': 'application/json'}))
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw TimeoutException("Connection time out"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['results'];
        List<TvShowsModel> topRated =
            List<TvShowsModel>.from(data.map((e) => TvShowsModel.fromJson(e)));
        return topRated;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TvShowsModel>> getPopularTvShows() async {
    try {
      final response = await dio
          .get(AppConstant.POPULAR_TV_SHOWS,
              options: Options(headers: {'Accept': 'application/json'}))
          .timeout(const Duration(seconds: 10),
              onTimeout: () => throw TimeoutException("Connection time out"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['results'];
        List<TvShowsModel> popular =
            List<TvShowsModel>.from(data.map((e) => TvShowsModel.fromJson(e)));
        return popular;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

}

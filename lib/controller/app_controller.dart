import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/models/movie_model.dart';
import 'package:moviestar/models/tv_shows_model.dart';
import 'package:moviestar/services/api_services.dart';

class AppController extends GetxController {
  var getTrendingMovies = <MovieModel>[].obs;
  var getPopularMovies = <MovieModel>[].obs;
  var getNowPlayingMovies = <MovieModel>[].obs;
  var getTopRatedMovies = <MovieModel>[].obs;

  var getTopRatedTvShows = <TvShowsModel>[].obs;
  var getPopularTvShows = <TvShowsModel>[].obs;

  ApiServices apiServices = ApiServices();
  var loading = true.obs;

  @override
  void onInit() {
    callMethod();
    super.onInit();
  }

  void callMethod() async {
    try {
      loading.value = true;
      var trendingMovies = await apiServices.getTrendingMovies();
      var popularMovies = await apiServices.getPopularMovies();
      var nowPlayingMovies = await apiServices.getNowPlayingMovies();
      var topRatedMovies = await apiServices.getTopRatedMovies();

      var topRatedTvShows = await apiServices.getTopRatedTvShows();
      var popularTvShows = await apiServices.getPopularTvShows();

      if (trendingMovies.isNotEmpty &&
          popularMovies.isNotEmpty &&
          nowPlayingMovies.isNotEmpty &&
          topRatedMovies.isNotEmpty &&
          topRatedTvShows.isNotEmpty &&
          popularTvShows.isNotEmpty) {

        getTrendingMovies.assignAll(trendingMovies);
        getPopularMovies.assignAll(popularMovies);
        getNowPlayingMovies.assignAll(nowPlayingMovies);
        getTopRatedMovies.assignAll(topRatedMovies);

        getTopRatedTvShows.assignAll(topRatedTvShows);
        getPopularTvShows.assignAll(popularTvShows);
      } else {
        debugPrint(null);
      }
    } finally {
      loading.value = false;
    }
    update();
  }
}

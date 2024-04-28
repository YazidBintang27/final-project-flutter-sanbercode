// ignore_for_file: constant_identifier_names

class AppConstant {
  static const API_KEY = "f7af57eee03f8a2ad9f1528179edce3e";

  static const TRENDING_MOVIES =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=$API_KEY";
  static const POPULAR_MOVIES =
      "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY";
  static const NOW_PLAYING_MOVIES =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$API_KEY";
  static const TOP_RATED_MOVIES =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$API_KEY";

  static const TOP_RATED_TV_SHOWS =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=$API_KEY";
  static const POPULAR_TV_SHOWS =
      "https://api.themoviedb.org/3/tv/popular?api_key=$API_KEY";
  static const ON_THE_AIR_TV_SHOWS =
      "https://api.themoviedb.org/3/tv/on_the_air?api_key=$API_KEY";

  static const IMAGE_PATH = "https://image.tmdb.org/t/p/original";
}

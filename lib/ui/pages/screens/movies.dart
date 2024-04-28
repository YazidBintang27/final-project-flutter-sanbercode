import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/controller/app_controller.dart';
import 'package:moviestar/ui/widgets/movie_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          Obx(() => controller.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    MovieListWidget(
                        category: "Top Rated",
                        data: controller.getTopRatedMovies),
                    MovieListWidget(
                        category: "Popular",
                        data: controller.getPopularMovies),
                    MovieListWidget(
                        category: "Trending",
                        data: controller.getTrendingMovies),
                    MovieListWidget(
                        category: "Now Playing",
                        data: controller.getNowPlayingMovies)
                  ],
                )),
        ],
      ),
    );
  }
}

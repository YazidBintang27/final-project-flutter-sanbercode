import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/controller/app_controller.dart';
import 'package:moviestar/ui/widgets/tv_shows_list.dart';

class TvShowsScreen extends StatelessWidget {
  const TvShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    return SingleChildScrollView(
      child: Expanded(
        child: Obx(() => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  TvShowsWidget(
                      category: "Top Rated",
                      data: controller.getTopRatedTvShows),
                  TvShowsWidget(
                      category: "Popular", data: controller.getPopularTvShows),
                ],
              )),
      ),
    );
  }
}
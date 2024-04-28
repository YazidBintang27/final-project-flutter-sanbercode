import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/controller/app_controller.dart';
import 'package:moviestar/ui/widgets/carousel_widget.dart';
import 'package:moviestar/ui/widgets/movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF6443E8).withOpacity(0.3),
            const Color(0xFF2B205C).withOpacity(0.6),
            const Color(0xFF131222).withOpacity(1.0),
          ],
          stops: const [0.0, 0.2, 0.9],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(
                    Icons.menu,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Trending for you",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(
                    Icons.notifications_none,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF6443E8),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const CarouselWidget(
                        autoPlay: true,
                        endlarge: true,
                        height: 350,
                        fraction: 0.6,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      MovieListWidget(
                          category: "Now Playing",
                          data: controller.getNowPlayingMovies)
                    ],
                  )),
          )
        ],
      ),
    );
  }
}

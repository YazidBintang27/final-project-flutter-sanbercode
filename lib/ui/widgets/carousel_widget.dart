import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/constant/app_constant.dart';
import 'package:moviestar/controller/app_controller.dart';

class CarouselWidget extends StatefulWidget {
  final bool autoPlay;
  final bool endlarge;
  final double fraction;
  final int height;
  const CarouselWidget({super.key, required this.autoPlay, required this.fraction, required this.height, required this.endlarge});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<String> imageData = [];

  @override
  void initState() {
    fetchImage();
    super.initState();
  }

  void fetchImage() {
    var controller = Get.put(AppController());
    for (int i = 0; i < controller.getTrendingMovies.length; i++) {
      imageData.add(controller.getTrendingMovies[i].posterPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageData
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  AppConstant.IMAGE_PATH + e,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 7),
          autoPlay: widget.autoPlay,
          enlargeCenterPage: widget.endlarge,
          height: widget.height.toDouble(),
          viewportFraction: widget.fraction),
    );
  }
}

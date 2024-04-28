import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/ui/pages/screens/home.dart';
import 'package:moviestar/ui/pages/screens/movies.dart';
import 'package:moviestar/ui/pages/screens/profile.dart';
import 'package:moviestar/ui/pages/screens/tv_shows.dart';

class ScreenController extends GetxController {
  var selectedIndex = 0.obs;
  void navigate(int value) => selectedIndex.value = value;
  List<Widget> screens = [
    const HomeScreen(),
    const ListScreen(),
    const TvShowsScreen(),
    const ProfileScreen()
  ];
}

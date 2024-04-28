import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moviestar/controller/screen_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: const BoxDecoration(color: Color(0xFF232239)),
          child: GNav(
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (value) => controller.navigate(value),
            backgroundColor: const Color(0xFF232239),
            gap: 8,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0xFF9A98AE).withOpacity(0.1),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.movie,
                text: "Movies",
              ),
              GButton(
                icon: Icons.live_tv,
                text: "Tv Shows",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              )
            ],
          ),
        ));
  }
}

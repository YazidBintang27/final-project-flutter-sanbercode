import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/routes/route_name.dart';
import 'package:moviestar/services/auth_services.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    bool available = false;
    AuthServices().checkUserAvailable().then((value) => available = value);
    Future.delayed(const Duration(seconds: 5), () {
      if (available) {
        Get.offAndToNamed(RouteName.mainPage);
      } else {
        Get.offAndToNamed(RouteName.onBoard);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ClipRRect(
          child: Image(
            image: AssetImage("assets/images/moviestar.png"),
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}

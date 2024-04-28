import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/routes/route_name.dart';
import 'package:moviestar/ui/widgets/button.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                        colors: [Color(0xFF131222), Colors.transparent],
                        stops: [0.3, 0.7],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(
                        Rect.fromLTRB(0, 0, bounds.width, bounds.height));
              },
              blendMode: BlendMode.dstIn,
              child: ClipRRect(
                  child: Image.asset(
                "assets/images/movies.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  const Text(
                    "Get started",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    "with our streaming app.",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Register or sign in now.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  ButtonWidget(
                    text: "Register",
                    action: () => Get.toNamed(RouteName.register),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Or",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  ButtonWidget(
                    text: "Sign in",
                    action: () => Get.toNamed(RouteName.signIn),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

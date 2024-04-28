import 'package:get/get.dart';
import 'package:moviestar/routes/route_name.dart';
import 'package:moviestar/ui/pages/main_page.dart';
import 'package:moviestar/ui/pages/onboard.dart';
import 'package:moviestar/ui/pages/profile_detail.dart';
import 'package:moviestar/ui/pages/register.dart';
import 'package:moviestar/ui/pages/sign_in.dart';
import 'package:moviestar/ui/pages/splash.dart';

class PageRoutes {
  static final pages = [
    GetPage(name: RouteName.splash, page: () => const Splash()),
    GetPage(name: RouteName.onBoard, page: () => const OnBoard()),
    GetPage(name: RouteName.register, page: () => const Register()),
    GetPage(name: RouteName.signIn, page: () => const SignIn()),
    GetPage(name: RouteName.mainPage, page: () => const MainPage()),
    GetPage(name: RouteName.profileDetail, page: () => const ProfileDetail())
  ];
}

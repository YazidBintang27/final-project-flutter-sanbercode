import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/routes/route_name.dart';
import 'package:moviestar/ui/widgets/button.dart';
import 'package:moviestar/ui/widgets/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _signOut() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouteName.onBoard);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/unknown-person.jpg",
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 4),
                  child: Text(
                    "Yazid Bintang",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Text(
                  "@yazidbintang@gmail.com",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                CardProfileWidget(
                    action: () {
                      Get.toNamed(RouteName.profileDetail);
                    },
                    leading: const Icon(Icons.person),
                    title: "Profile Detail",
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )),
                CardProfileWidget(
                  action: () {},
                    leading: const Icon(Icons.edit),
                    title: "Edit Profile",
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )),
                CardProfileWidget(
                  action: () {},
                    leading: const Icon(Icons.lock),
                    title: "Change Password",
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )),
                CardProfileWidget(
                  action: () {},
                    leading: const Icon(Icons.settings),
                    title: "Settings",
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                ButtonWidget(text: "Sign Out", action: _signOut)
              ],
            ),
          ]),
        ));
  }
}

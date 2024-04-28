import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/routes/route_name.dart';
import 'package:moviestar/services/auth_services.dart';
import 'package:moviestar/ui/widgets/button.dart';
import 'package:moviestar/ui/widgets/form.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSucceed = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    setState(() {
      _isSucceed = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithUserAndPassword(email, password);

    setState(() {
      _isSucceed = false;
    });

    if (user != null) {
      debugPrint("Sign In Successful");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            "Sign in Successful",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
      Get.offAllNamed(RouteName.mainPage);
    } else {
      debugPrint("Fill all field");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.red[400], borderRadius: BorderRadius.circular(20)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign in Failed",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Please, check your email and password !",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                const ClipRRect(
                  child: Image(
                    image: AssetImage("assets/images/moviestar.png"),
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign in to continue",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                FormWidget(
                  controller: _emailController,
                  isPasswordField: false,
                  prefix: Icon(
                    Icons.email,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  hintText: "Email",
                ),
                FormWidget(
                  controller: _passwordController,
                  isPasswordField: true,
                  prefix: Icon(
                    Icons.lock,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  hintText: "Password",
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 14, color: Color(0xFF1246FF)),
                    ),
                  ),
                ),
                ButtonWidget(
                  text: "Sign in",
                  action: _signIn,
                  loading: _isSucceed,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAndToNamed(RouteName.register),
                      child: const Text(
                        "Register",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF1246FF)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/routes/route_name.dart';
import 'package:moviestar/services/auth_services.dart';
import 'package:moviestar/ui/widgets/button.dart';
import 'package:moviestar/ui/widgets/form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSucceed = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    setState(() {
      _isSucceed = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _auth.signUpWithUserAndPassword(username, email, password);

    setState(() {
      _isSucceed = false;
    });

    if (user != null) {
      debugPrint("Register Success");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            "Register Successful",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
      Get.offAndToNamed(RouteName.signIn);
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
                "Register Failed",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Please, check your username, email and password !",
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
                  height: MediaQuery.of(context).size.height / 9,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Register to continue",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                FormWidget(
                  controller: _usernameController,
                  isPasswordField: false,
                  prefix: Icon(
                    Icons.person,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  hintText: "Username",
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
                  text: "Register",
                  action: _register,
                  loading: _isSucceed,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAndToNamed(RouteName.signIn),
                      child: const Text(
                        "Sign in",
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

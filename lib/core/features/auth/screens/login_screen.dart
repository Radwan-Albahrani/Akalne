import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              "assets/lottieIcons/LoginIcon.json",
              height: 400.h,
              width: 400.w,
            ),
            Form(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In with your",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Sign In"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

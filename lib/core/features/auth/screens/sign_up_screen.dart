import 'package:akalne/core/constants/app_routes.dart';
import 'package:akalne/core/features/auth/screens/widgets/rounded_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset(
                "assets/lottieIcons/LoginIcon.json",
                height: 200.h,
                width: 200.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Sign In to your Account",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedFormField(
                        controller: nameController,
                        hintText: "Your name",
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RoundedFormField(
                        controller: phoneController,
                        hintText: "phone number",
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RoundedFormField(
                        controller: emailController,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RoundedFormField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Login",
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () => navigateToLoginScreen(context),
                            child: Text(
                              "Sign In",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

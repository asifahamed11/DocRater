// Import necessary packages
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/UIhelper.dart'; // Custom UI helper class
import 'package:app/signuppage.dart'; // Page for signing up
import 'package:app/HomeView.dart'; // Home view after login
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

// Define a stateful widget for the login page
class LoginPage extends StatefulWidget {
  // Constructor to receive username as a parameter
  const LoginPage({Key? key, required this.userName}) : super(key: key);

  // Property to hold the username
  final String userName;

  // Create state for the widget
  @override
  State<LoginPage> createState() => _LoginPageState();
}

// State class for the login page
class _LoginPageState extends State<LoginPage> {
  // Text editing controllers for email and password fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Async function to handle login process
  Future<void> Login(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        String userName = userCredential.user?.displayName ?? "";
        showSuccessAnimation(context);
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: HomeView(userName: userName),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 500),
            ),
          );
        });
      } on FirebaseAuthException catch (ex) {
        showErrorAnimation(context);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/back_arrow.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "   Welcome back.",
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "     You've been missed!",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            const SizedBox(height: 50),
            // Your existing UI elements here
            UiHelper.CustomTextfield(
                emailController, Icons.mail, "Email", false),
            UiHelper.CustomTextfield(
                passwordController, Icons.lock, "Password", true),
            const SizedBox(height: 10),
            // Text and button for navigating to sign up page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      // Navigate to sign up page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: const Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ))
              ],
            ),
            const SizedBox(height: 100),
            Center(
              child: UiHelper.CustomButton(
                () {
                  Login(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                  );
                },
                "Log In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSuccessAnimation(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black
        .withOpacity(0.5), // Set the barrier color to a semi-transparent black
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Set the blur radius
          child: ColorFiltered(
            colorFilter:
                ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
            child: Lottie.asset(
              'animations/login_successfully.json',
              width: 200,
              height: 200,
            ),
          ),
        ),
      );
    },
  );
}

void showErrorAnimation(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black
        .withOpacity(0.5), // Set the barrier color to a semi-transparent black
    builder: (context) {
      return Dialog(
        backgroundColor: Colors
            .transparent, // Set the background color of the Dialog to transparent
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Set the blur radius
          child: ColorFiltered(
            colorFilter:
                ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
            child: Lottie.asset(
              'animations/login_unsuccessful.json',
              width: 200,
              height: 200,
            ),
          ),
        ),
      );
    },
  );
}

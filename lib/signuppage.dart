// Import necessary packages
import 'package:flutter/material.dart'; // Flutter material library for UI components
import 'package:firebase_auth/firebase_auth.dart'; // Firebase authentication package
import 'package:app/UIhelper.dart'; // Custom UI helper class
import 'package:app/login_page.dart'; // Login page widget
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // Function to get password requirements
  String _getPasswordRequirements() {
    String requirements = "";
    if (passwordController.text.length < 8) {
      requirements += "- Minimum 8 characters\n";
    }
    if (!RegExp(r'[A-Z]').hasMatch(passwordController.text)) {
      requirements += "- At least one uppercase letter\n";
    }
    if (!RegExp(r'[a-z]').hasMatch(passwordController.text)) {
      requirements += "- At least one lowercase letter\n";
    }
    if (!RegExp(r'[0-9]').hasMatch(passwordController.text)) {
      requirements += "- At least one digit\n";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(passwordController.text)) {
      requirements += "- At least one special character\n";
    }
    return requirements;
  }

  // Function to handle sign-up process
  void _signUP(String email, String password, String name) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      // Check if required fields are empty
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    } else if (!_isPasswordValid(password)) {
      // Check if password meets requirements
      String requirements = _getPasswordRequirements();
      UiHelper.CustomAlertBox(
          context, "Password requirements not met:\n\n$requirements");
    } else {
      try {
        // Create user with email and password using Firebase authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // Update user display name
        await userCredential.user?.updateDisplayName(name);
        // Navigate to login page after successful sign-up
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(
              userName: name,
            ),
          ),
        );
      } on FirebaseAuthException catch (ex) {
        // Handle Firebase authentication exceptions
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  // Function to check if password is valid
  bool _isPasswordValid(String password) {
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  @override
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "   Register",
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "     Create new account to get \n     started.",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            const SizedBox(height: 50),
            UiHelper.CustomTextfield(
                nameController, Icons.person, "Name", false),
            UiHelper.CustomTextfield(
                emailController, Icons.mail, "Email", false),
            UiHelper.CustomTextfield(
                passwordController, Icons.lock, "Password", true),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(
                          userName: "",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Center(
              child: UiHelper.CustomButton(
                () {
                  _signUP(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                    nameController.text.toString(),
                  );
                },
                "Register",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

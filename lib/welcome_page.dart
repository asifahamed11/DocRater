import 'package:app/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

// Constants
const kHeadingText = "DocRater\nYour Healthcare Compass";
const kBodyText =
    "Discover trusted doctors tailored to your needs. With DocRater, personalized care is just a tap away. Empowering you to make informed healthcare decisions.";

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isRegisterButtonSelected = true;

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Lottie.asset('animations/welcome.json'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      kHeadingText,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        kBodyText,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              ButtonRow(
                isRegisterButtonSelected: _isRegisterButtonSelected,
                onRegisterPressed: () {
                  setState(() {
                    _isRegisterButtonSelected = true;
                  });
                  _navigateToPage(SignupPage());
                },
                onSignInPressed: () {
                  setState(() {
                    _isRegisterButtonSelected = false;
                  });
                  _navigateToPage(LoginPage(userName: 'XXX'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  final bool isRegisterButtonSelected;
  final VoidCallback onRegisterPressed;
  final VoidCallback onSignInPressed;

  const ButtonRow({
    Key? key,
    required this.isRegisterButtonSelected,
    required this.onRegisterPressed,
    required this.onSignInPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: isRegisterButtonSelected
                      ? Colors.grey.shade200
                      : Colors.transparent,
                  foregroundColor:
                      isRegisterButtonSelected ? Colors.black87 : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: onRegisterPressed,
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: isRegisterButtonSelected
                      ? Colors.transparent
                      : Colors.grey.shade200,
                  foregroundColor:
                      isRegisterButtonSelected ? Colors.white : Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: onSignInPressed,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

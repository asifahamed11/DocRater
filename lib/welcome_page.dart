import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/signuppage.dart'; // Page for signing up
import 'package:app/login_page.dart'; // Login page widget
import 'package:lottie/lottie.dart';

// Constants
const kHeadingText = "DocRater\nYour Healthcare Compass";
const kBodyText =
    "Discover trusted doctors tailored to your needs. With DocRater, personalized care is just a tap away. Empowering you to make informed healthcare decisions.";

class WelcomePage extends StatelessWidget {
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      kHeadingText,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        kBodyText,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              ButtonRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  bool _isRegisterButtonSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _isRegisterButtonSelected
                      ? Colors.white
                      : Colors.transparent,
                  foregroundColor:
                      _isRegisterButtonSelected ? Colors.black87 : Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isRegisterButtonSelected = true;
                  });
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
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
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _isRegisterButtonSelected
                      ? Colors.transparent
                      : Colors.white,
                  foregroundColor:
                      _isRegisterButtonSelected ? Colors.white : Colors.black87,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isRegisterButtonSelected = false;
                  });
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => LoginPage(
                        userName: 'XXX',
                      ),
                    ),
                  );
                },
                child: Text(
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

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for custom fonts
import 'package:carousel_slider/carousel_slider.dart'; // Import for carousel slider

class AboutScreen extends StatelessWidget {
  final List<String> testimonials = [
    'This app is a game-changer for finding the best doctors!',
    'Booking appointments has never been easier thanks to this app.',
    'I love the user-friendly interface and the detailed doctor profiles.',
  ];

  final List<String> appScreenshots = [
    'assets/images/screenshot1.png',
    'assets/images/screenshot2.png',
    'assets/images/screenshot3.png',
  ];

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
        backgroundColor: Colors.white,
        title: Text(
          'About',
          style: GoogleFonts.poppins(fontSize: 30), // Using custom font
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          // Animated background
          Container(
            height: 300,
            width: 700,
            child: Lottie.asset('animations/animated_background.json'),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  height: 200,
                  child: Image.asset('animations/hospital_preloaded.gif'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Our App',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'This is a medical app that helps you find and book appointments with various specialists.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Features:',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '- Search for specialists by category\n- View doctor profiles',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'App Statistics', // App statistics section
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '- 10,000+ registered users\n- 500+ doctors listed',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Testimonials', // Testimonials section
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: testimonials.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 300,
                              margin: EdgeInsets.only(right: 16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                testimonials[index],
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'App Screenshots', // App screenshots section
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 200,
                        child: CarouselSlider.builder(
                          itemCount: appScreenshots.length,
                          itemBuilder: (context, index, realIndex) {
                            return Image.asset(appScreenshots[index]);
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your call-to-action logic here
                          },
                          child: Text(
                            'Download Now', // Call-to-action button
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Add your social media link logic here
                            },
                            icon: Icon(Icons.facebook),
                          ),
                          SizedBox(width: 16),
                          IconButton(
                            onPressed: () {
                              // Add your social media link logic here
                            },
                            icon: Icon(Icons.image),
                          ),
                          SizedBox(width: 16),
                          IconButton(
                            onPressed: () {
                              // Add your social media link logic here
                            },
                            icon: Icon(Icons.face),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

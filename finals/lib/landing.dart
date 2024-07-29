import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/children.jpg'), // Add your image asset here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with content
          Container(
            color: Colors.black
                .withOpacity(0.3), // Dark overlay to make text readable
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Centered Opaque Box
                    Container(
                      width: 500,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7), // Set opacity
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title inside the box
                          Text(
                            'Welcome to the Child Development Center (CDC) of Mabini, Batangas',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          // Subtitle inside the box
                          Text(
                            'Where every child\'s potential is nurtured and communities thrive. Despite our vital role, the absence of an online presence has posed challenges. Parents struggle to stay updated on CDC activities, often missing out on important announcements. Our registration process, too, faces hurdles, with missing child documents complicating matters.\n\nWe\'re here to bridge these gaps. Our new online platform serves as your gateway to CDC, providing up-to-date information, streamlined processes, and essential resources. Join us in empowering our community and ensuring every child\'s journey is filled with opportunities for growth and development.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),
                          // Call-to-action Button inside the box
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/home'); // Navigate to HomeScreen
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                  255, 79, 245, 101), // Button color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            child: Text('Get Started'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

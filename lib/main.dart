import 'package:flutter/material.dart';
import 'bike_selection_screen.dart';

void main() {
  runApp(BikeRentalApp());
}

class BikeRentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: LoginScreen(), // Start with the Login screen
    );
  }
}

// Login Screen (First Screen)
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Bike-Rental-System.webp'), // Path to your image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BikeSelectionScreen()),
              );
            },
            child: Text('Open'), // Changed button text to "Open"
          ),
        ),
      ),
    );
  }
}
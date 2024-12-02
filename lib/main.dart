import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'screens/login_screen.dart';  // Import your login screen
import 'screens/weather_screen.dart'; // Import the weather screen (if you need it)
import 'package:flutter/foundation.dart'; // Import for kIsWeb if needed

void main() async {
  // Ensure that widget binding is initialized before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDLZwDys8_TztuikzhQab0r6_Ef4liKpnA",
      authDomain: "bike-rental-app-4e81f.firebaseapp.com",
      projectId: "bike-rental-app-4e81f",
      storageBucket: "bike-rental-app-4e81f.firebasestorage.app",
      messagingSenderId: "207431579317",
      appId: "1:207431579317:web:939a11ff448841aa48b0fc",
      measurementId: "G-6Y59VTCGQJ",
    ),
  );

  // If it's a web app, register the Google Maps plugin (or any other setup)
  if (kIsWeb) {
    // Register your web-specific plugins here (e.g., Google Maps for Web if needed)
  }

  // Run the app
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
      routes: {
        // You can add other routes if needed, e.g., for weather or bike selection
        '/weather': (context) => WeatherScreen(),
      },
    );
  }
}

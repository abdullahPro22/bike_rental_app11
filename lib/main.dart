import 'package:flutter/material.dart';
import 'bike_selection_screen.dart'; // Import the bike selection screen

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
      home: LoginScreen(), // Start with the Login screen
    );
  }
}

// Login Screen (First Screen)
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  void _onLoginPressed() {
    _controller.forward().then((value) {
      _controller.reverse().then((value) {
        // On login success, navigate to Bike Selection screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BikeSelectionScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Smaller TextField for Username
                SizedBox(
                  width: 200, // Adjust width as needed
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8), // Light background for better visibility
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Smaller TextField for Password
                SizedBox(
                  width: 200, // Adjust width as needed
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8), // Light background for better visibility
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10),
                ScaleTransition(
                  scale: _animation,
                  child: ElevatedButton(
                    onPressed: _onLoginPressed,
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

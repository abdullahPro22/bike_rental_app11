// lib/bike_selection_screen.dart

import 'package:flutter/material.dart';
import 'bike_detail_screen.dart'; // Import the bike detail screen

// Bike Selection Screen (Second Screen)
class BikeSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bikes = [
    {
      'name': 'Super Bike',
      'image': 'assets/super bike.webp',
      'price': 150, // Price per day
    },
    {
      'name': 'Dirt Bike',
      'image': 'assets/dirt bike.jpg',
      'price': 100,
    },
    {
      'name': 'Cycle',
      'image': 'assets/cycle.webp',
      'price': 20,
    },
    {
      'name': 'Road Bike',
      'image': 'assets/honda 125.png',
      'price': 80,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Bike Type'),
      ),
      body: ListView.builder(
        itemCount: bikes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              bikes[index]['image'],
              width: 50,
              height: 50,
            ),
            title: Text(bikes[index]['name']),
            // Removed the subtitle that showed the price
            onTap: () {
              // Use a FadeTransition for the animation
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => BikeDetailScreen(
                    bikeType: bikes[index]['name'],
                    price: bikes[index]['price'], // Pass price to details (but don't display here)
                    image: bikes[index]['image'], // Pass image to details
                  ),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = 0.0;
                    const end = 1.0;
                    const curve = Curves.easeInOut;

                    var tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var opacityAnimation = animation.drive(tween);

                    return FadeTransition(
                      opacity: opacityAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

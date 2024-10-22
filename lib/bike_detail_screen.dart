import 'package:flutter/material.dart';

class BikeDetailScreen extends StatefulWidget {
  final String bikeType;
  final int price;
  final String image;

  BikeDetailScreen({
    required this.bikeType,
    required this.price,
    required this.image,
  });

  @override
  _BikeDetailScreenState createState() => _BikeDetailScreenState();
}

class _BikeDetailScreenState extends State<BikeDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation when the screen is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Make sure that your assets are correctly loaded from the pubspec.yaml file
    String bikeDetails;
    if (widget.bikeType == 'Super Bike') {
      bikeDetails =
      'A sports motorcycle, sports bike, or sport bike is a motorcycle designed and optimized for speed, acceleration, braking, and cornering on asphalt concrete race tracks and roads. They are mainly designed for performance at the expense of comfort, fuel economy, safety, noise reduction and storage in comparison with other motorcycles..';
    } else if (widget.bikeType == 'Dirt Bike') {
      bikeDetails =
      'Dirt bikes are easy to learn on with a comfortable seat at (usually) a reasonable height. They may not have the power/torque and suspension of a more race-ready enduro or motocross bike. But they can still go anywhere a rider is capable of taking them. The bikes in this segment are also typically cheaper to purchase and maintain. Generally these bikes have 4 stroke air cooled engines and are highly reliable requiring little maintenance..';
    } else if (widget.bikeType == 'Cycle') {
      bikeDetails =
      'A simple and eco-friendly cycle for daily commuting or exercise. Lightweight and easy to handle in urban environments.';
    } else if (widget.bikeType == 'Road Bike') {
      bikeDetails =
      'The Honda CG125 or Honda CG is a commuter motorcycle made by Honda of Japan. It was in production from 1976 to 2008 in Japan and has been in production since 1992 in Pakistan. The CG was originally manufactured in Japan, but the source for the European market was eventually moved to Brazil in 1985, and to Pakistan and Turkey in 1992 for the W and M models. The CG125 is powered by a 124 cc (7.6 cu in) four-stroke.';
    } else {
      bikeDetails = 'Details for this bike are not available.';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.bikeType} Details'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display the image of the bike
                  Image.asset(
                    widget.image,
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Details about ${widget.bikeType}:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Price: \$${widget.price} per day',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    bikeDetails,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the bike selection
                    },
                    child: Text('Go Back'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

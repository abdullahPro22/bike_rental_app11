import 'package:flutter/material.dart';

class BikeDetailScreen extends StatelessWidget {
  final String bikeType;
  final int price;
  final String image;

  BikeDetailScreen({
    required this.bikeType,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$bikeType Details', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Details about $bikeType',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(height: 14, thickness: 1.5),
            Text(
              'Price: \$${price} per day',
              style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              _getBikeDetails(),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBikeDetails() {
    switch (bikeType) {
      case 'Super Bike':
        return 'The BMW K1300R is a high-performance naked sport bike that combines power, advanced technology, and an aggressive design. With a 1,293 cc inline-four engine producing 173 horsepower and 140 Nm of torque, it offers impressive acceleration and a top speed of around 165 mph (265 km/h). Its lightweight aluminum frame, coupled with BMW’s Duolever front and Paralever rear suspension, ensures agile yet stable handling. The bike also features dual-disc front brakes, ABS, and optional traction control and Electronic Suspension Adjustment (ESA) for customizable riding dynamics. The K1300R’s muscular look, smooth power delivery, and comfortable ride make it ideal for both city commuting and long-distance journeys, appealing to riders who seek performance with standout style.';
      case 'Dirt Bike':
        return 'A dirt bike is a lightweight, off-road motorcycle specifically designed for rugged terrains and challenging trails. Built with a compact frame and high ground clearance, it can easily handle obstacles and rough landscapes. Dirt bikes typically have a single-cylinder engine, ranging from 50cc to 450cc, which provides high torque at low speeds—ideal for climbing hills and maneuvering over rough surfaces. The lightweight frame, often made from durable materials like aluminum or steel, enhances handling and control. Additionally, the long-travel suspension with extended front forks and rear shocks allows dirt bikes to absorb impacts, making them perfect for jumps, uneven trails, and adventurous riding in challenging environments.';
      case 'Cycle':
        return 'A bicycle, or cycle, is a two-wheeled vehicle powered by human effort, typically through pedals connected to a drivetrain that propels the wheels forward. Known for its simplicity, affordability, and versatility, the bicycle has become one of the most popular modes of transportation worldwide. Bikes come in various types, including road bikes for smooth pavement, mountain bikes for rugged trails, hybrid bikes for mixed terrains, and electric bikes that provide motor-assisted pedaling. With a lightweight frame, efficient gearing, and braking systems, bicycles are ideal for commuting, exercise, and recreation. Besides being eco-friendly, cycling promotes physical fitness, making it a healthy, sustainable choice for short and long journeys alike.';
      case 'Road Bike':
        return 'The Honda 125 is a popular lightweight motorcycle, known for its reliability, fuel efficiency, and ease of use, making it an ideal choice for both beginner and experienced riders. Powered by a 125cc four-stroke, single-cylinder engine, this model delivers a smooth ride with enough power for urban commuting while maintaining impressive fuel economy. Its compact design, coupled with a comfortable seat and straightforward handling, makes it well-suited for navigating city streets and short-distance travel. With durable components, low maintenance costs, and Honda’s reputation for quality, the Honda 125 has become a trusted and accessible motorcycle choice worldwide, especially in regions where economical, practical transport is essential.';
      case 'Quad Bike':
        return 'A quad bike is an off-road four-wheeler designed for rugged terrains. Equipped with a powerful engine and wide tires, it ensures stability and control, making it perfect for outdoor adventures and rough trails.';
      case 'Electric Scooter':
        return 'The electric scooter is an eco-friendly, motorized two-wheeler designed for short city commutes. It features a rechargeable battery and lightweight design, offering a smooth, quiet, and efficient riding experience.';
      case 'Cruiser Bike':
        return 'The cruiser bike is designed for long, comfortable rides with a relaxed seating position, powerful engine, and stylish design. Its heavy-duty frame and smooth performance make it ideal for highway cruising and leisure travel.';
        default:
        return 'Details are not available for this bike type.';
    }
  }
}
import 'package:flutter/material.dart';
import '/services/weather_service.dart'; // Import the WeatherService
import 'bike_detail_screen.dart';

class BikeSelectionScreen extends StatefulWidget {
  @override
  _BikeSelectionScreenState createState() => _BikeSelectionScreenState();
}

class _BikeSelectionScreenState extends State<BikeSelectionScreen> {
  final List<Map<String, dynamic>> bikes = [
    {'name': 'Super Bike', 'image': 'assets/super bike.webp', 'price': 150},
    {'name': 'Dirt Bike', 'image': 'assets/dirt bike.jpg', 'price': 100},
    {'name': 'Cycle', 'image': 'assets/cycle.webp', 'price': 20},
    {'name': 'Road Bike', 'image': 'assets/honda 125.png', 'price': 80},
    {'name': 'Quad Bike', 'image': 'assets/quad bike.jpg', 'price': 200},
    {'name': 'Electric Scooter', 'image': 'assets/electric scooter.jpg', 'price': 50},
    {'name': 'Cruiser Bike', 'image': 'assets/cruiser bike.jpg', 'price': 120},
  ];

  final TextEditingController _cityController = TextEditingController();
  String _weatherData = '';
  final WeatherService _weatherService = WeatherService();

  // Function to fetch weather based on the entered city
  void _fetchWeather() async {
    final city = _cityController.text;

    if (city.isNotEmpty) {
      final weather = await _weatherService.getWeather(city);

      setState(() {
        if (weather != null) {
          _weatherData = 'Temp: ${weather['main']['temp']}°C\n'
              'Weather: ${weather['weather'][0]['description']}';
        } else {
          _weatherData = 'Error fetching weather data';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Stack(
              children: [
                Image.asset(
                  'assets/header image.jpg', // Replace with your header image
                  height: 650,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Text(
                    'My Bikes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Description Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Rent your favorite bikes and enjoy the ride! Explore our collection of bikes for all terrains and styles.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),

            // Weather Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter city to get weather:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _fetchWeather,
                    child: Text('Get Weather'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _weatherData,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Icon Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIcon(Icons.directions_bike, "Bikes"),
                  _buildIcon(Icons.electric_bike, "E-Bikes"),
                  _buildIcon(Icons.motorcycle, "Scooters"),
                  _buildIcon(Icons.star, "Favorites"),
                ],
              ),
            ),

            // Bike Grid Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: bikes.length,
                itemBuilder: (context, index) => _buildBikeCard(context, bikes[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Icon Builder Method
  Widget _buildIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }

  // Bike Card Builder Method
  Widget _buildBikeCard(BuildContext context, Map<String, dynamic> bike) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              bike['image'],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bike['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "\$${bike['price']}/day",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => _navigateToDetail(context, bike),
                child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Navigation to Bike Details Screen
  void _navigateToDetail(BuildContext context, Map<String, dynamic> bike) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BikeDetailScreen(
          bikeType: bike['name'],
          price: bike['price'],
          image: bike['image'],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/weather_service.dart'; // Import the correct weather_service.dart

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _city = '';
  String _weatherData = '';

  final WeatherService _weatherService = WeatherService(); // Create an instance of WeatherService

  // Fetch the weather when the button is pressed
  void _fetchWeather() async {
    final city = _cityController.text;

    if (city.isNotEmpty) {
      final weather = await _weatherService.getWeather(city);

      if (weather != null) {
        setState(() {
          _weatherData = 'Temp: ${weather['main']['temp']}°C\n'
              'Weather: ${weather['weather'][0]['description']}';
        });
      } else {
        setState(() {
          _weatherData = 'Error fetching weather data';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // City input field
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Fetch weather button
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16),
            // Display weather data
            Text(
              _weatherData,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

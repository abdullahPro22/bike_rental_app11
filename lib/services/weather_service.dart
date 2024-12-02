import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static const String _apiKey = '4d05d1852f9a31720f5a766881eb9598'; // Replace with your OpenWeatherMap API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Fetch weather data for a given city
  Future<Map<String, dynamic>?> getWeather(String city) async {
    final url = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric'); // API call with metric units for Celsius

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      return null;
    }
  }
}

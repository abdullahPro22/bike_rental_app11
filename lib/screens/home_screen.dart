import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/weather_service.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> bikes = [];


  // Save bike data to Firebase
  Future<void> saveBikeDataToFirebase(List<dynamic> bikes) async {
    await FirebaseService.saveBikes(bikes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bike Rental App")),
      body: bikes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: bikes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(bikes[index]['image']),
            title: Text(bikes[index]['name']),
            subtitle: Text('\$${bikes[index]['price']}/day'),
          );
        },
      ),
    );
  }
}

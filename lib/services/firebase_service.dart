import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save bikes data to Firestore
  static Future<void> saveBikes(List<dynamic> bikes) async {
    final bikeCollection = _db.collection('bikes');

    for (var bike in bikes) {
      await bikeCollection.add({
        'name': bike['name'],
        'price': bike['price'],
        'image': bike['image'],
      });
    }
  }

  // Fetch bikes data from Firestore (optional)
  static Future<List<dynamic>> fetchBikesFromFirestore() async {
    final bikeCollection = await _db.collection('bikes').get();
    return bikeCollection.docs.map((doc) => doc.data()).toList();
  }
}

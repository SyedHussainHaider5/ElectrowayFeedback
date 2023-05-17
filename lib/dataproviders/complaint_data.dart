import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore_complaint {
  // static final firebase = FirebaseFirestore.instance;
  // static final collection = firebase.collection("cars");

  Future<List<Map<String, dynamic>>> fetchCars() async {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get a reference to the collection
    CollectionReference carsRef = firestore.collection('cars');

    // Query the collection
    QuerySnapshot querySnapshot = await carsRef.get();

    // Convert the query snapshot to a list of maps
    List<Map<String, dynamic>> cars = [];
    querySnapshot.docs.forEach((doc) {
      cars.add(doc.data() as Map<String, dynamic>);
    });

    return cars;
  }
}

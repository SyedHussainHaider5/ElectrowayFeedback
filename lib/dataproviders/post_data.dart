import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore_post {
  // static final firebase = FirebaseFirestore.instance;
  // static final collection = firebase.collection("cars");

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get a reference to the collection
    CollectionReference postsRef = firestore.collection('posts');

    // Query the collection
    QuerySnapshot querySnapshot = await postsRef.get();

    // Convert the query snapshot to a list of maps
    List<Map<String, dynamic>> posts = [];
    querySnapshot.docs.forEach((doc) {
      posts.add(doc.data() as Map<String, dynamic>);
    });

    return posts;
  }

  void createComplaint(text) async {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get a reference to the "complaints" collection
    CollectionReference complaintsRef = firestore.collection('complaints');

    // Generate a new complaint ID
    String complaintId = complaintsRef.doc().id;

    // Create a new document with the complaint ID and other fields
    await complaintsRef.doc(complaintId).set({
      'complaint_id': complaintId,
      'complaint_description': text,
      'user_id': 'abc123',
      'date': DateTime.now(),
    });

    print('Complaint added with ID: $complaintId');
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore_post {
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

  void createPost(text) async {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get a reference to the "complaints" collection
    CollectionReference postsRef = firestore.collection('posts');

    // Generate a new complaint ID
    String postId = postsRef.doc().id;

    // Create a new document with the complaint ID and other fields
    await postsRef.doc(postId).set({
      'post_id': postId,
      'post_description': text,
      'user_id': 'abc123',
      'date': DateTime.now(),
      'likes': 12,
      'username': 'Wadood Jamal',
      'email_id': 'syedhussainhaider5@gmail.com'
    });

    print('Complaint added with ID: $postId');
  }
}

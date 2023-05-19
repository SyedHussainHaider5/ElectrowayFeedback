import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore_post {
  Future<List<Map<String, dynamic>>> fetchPosts() async {
    // Get a Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get a reference to the collection
    CollectionReference postsRef = firestore.collection('posts');

    // Query the collection
    QuerySnapshot querySnapshot =
        await postsRef.orderBy('timestamp', descending: true).get();

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
      'likes': [],
      'comments': [],
      'username': 'Wadood Jamal',
      'email_id': 'syedhussainhaider5@gmail.com',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> addValueToLikesField(String postId, dynamic valueToAdd) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('posts');
    final DocumentReference docRef = collectionRef.doc(postId);

    // Update the array field with the new value
    await docRef.update({
      'likes': FieldValue.arrayUnion([valueToAdd]),
    });
  }

  Future<void> removeValueFromLikesField(
      String postId, dynamic valueToRemove) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('posts');
    final DocumentReference docRef = collectionRef.doc(postId);

    // Update the array field by removing the value
    await docRef.update({
      'likes': FieldValue.arrayRemove([valueToRemove]),
    });
  }

  Future<bool> checkIfLiked(String postId, String valueToCheck) async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('posts').doc(postId).get();

    final likes = snapshot.get('likes');

    if (likes != null && likes.contains(valueToCheck)) {
      return true;
    }

    return false;
  }

  Future<int> countLikes(String documentId) async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .doc(documentId)
          .get();

      final data = documentSnapshot.data();
      if (data != null && (data as Map<String, dynamic>).containsKey('likes')) {
        final likesArray = List<dynamic>.from(data['likes']);
        return likesArray.length;
      }

      return 0;
    } catch (e) {
      print('Error counting items: $e');
      return 0;
    }
  }

  // Future<void> addComment(String postId, Map<String, String> valueToAdd) async {
  //   try {
  //     final CollectionReference collectionRef =
  //         FirebaseFirestore.instance.collection('posts');
  //     final DocumentReference docRef = collectionRef.doc(postId);

  //     // Retrieve the existing array
  //     final DocumentSnapshot docSnapshot = await docRef.get();
  //     final existingArray = List<dynamic>.from(docSnapshot['comments']);

  //     // Add the new value to the existing array
  //     existingArray.add(valueToAdd);

  //     // Update the document with the modified array
  //     // await docRef.update({'comments': existingArray});
  //     await docRef.update({
  //       'comments': FieldValue.arrayUnion([valueToAdd]),
  //     });

  //     print('Comment added successfully!');
  //   } catch (e) {
  //     print('Error adding comment: $e');
  //   }
  // }

  // Future<void> addComment(String postId,
  //     String arrayFieldName, Map<String, dynamic> newValues) async {
  //   try {
  //     final DocumentReference documentRef =
  //         FirebaseFirestore.instance.collection('posts').doc(postId);

  //     final DocumentSnapshot documentSnapshot = await documentRef.get();

  //     if (documentSnapshot.exists) {
  //       final List<dynamic> existingArray =
  //           (documentSnapshot.data()?[arrayFieldName] as List<dynamic>) ?? [];

  //       // Add new values to the existing array
  //       existingArray.add(newValues);

  //       await documentRef.update({arrayFieldName: existingArray});
  //       print('Values added to the array successfully!');
  //     } else {
  //       print('Document does not exist.');
  //     }
  //   } catch (e) {
  //     print('Error adding values to array: $e');
  //   }
  // }

  Future<void> addComment(String postId, Map<String, dynamic> newValue) async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('posts');
    final DocumentReference docRef = collectionRef.doc(postId);

    // Update the array field with the new value
    await docRef.update({
      'comments': FieldValue.arrayUnion([newValue]),
    });
  }

  Future<List<Map<String, dynamic>>> fetchComments(String postId) async {
    try {
      final DocumentReference documentRef =
          FirebaseFirestore.instance.collection('posts').doc(postId);

      final DocumentSnapshot documentSnapshot = await documentRef.get();

      if (documentSnapshot.exists) {
        final List<dynamic> arrayData = documentSnapshot.get('comments');
        final List<Map<String, dynamic>> result = [];

        for (var item in arrayData) {
          if (item is Map<String, dynamic>) {
            result.add(item);
          }
        }

        return result;
      } else {
        print('Document does not exist.');
        return [];
      }
    } catch (e) {
      print('Error retrieving array: $e');
      return [];
    }
  }

  Future<String?> fetchUsername(String userId) async {
    try {
      final DocumentReference documentRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      final DocumentSnapshot documentSnapshot = await documentRef.get();

      if (documentSnapshot.exists) {
        final String username = documentSnapshot.get('fullName');
        return username;
      } else {
        print('User document does not exist.');
        return null;
      }
    } catch (e) {
      print('Error fetching username: $e');
      return null;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getPosts() {
    final posts = _firestore.collection('posts').snapshots();
    return posts;
  }

  getPost(String id) {
    final post = _firestore.collection('posts').doc(id).get();
    return post;
  }
}

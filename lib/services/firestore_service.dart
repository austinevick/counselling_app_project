import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling_app_project/model/job.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabase {
  static User user = AuthenticationService.currentUser;

  static Future<void> addItems(Job itemData) {
    final path = 'users/${user.uid}/jobs/job_abc';
    final docRef = FirebaseFirestore.instance.doc(path);
    return docRef.set(itemData.toMap());
  }
}

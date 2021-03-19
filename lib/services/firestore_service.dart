import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling_app_project/model/job.dart';
import 'package:counselling_app_project/model/user.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  static User user = AuthenticationService.currentUser;

  static saveUsersData(Users userData) async {
    final path = 'Users';
    final ref = FirebaseFirestore.instance.collection(path);
    await ref.doc(user.uid).set(userData.toMap());
  }

  static Stream<List<Users>> fetchUsers() {
    final userRef = FirebaseFirestore.instance.collection('users');
    return userRef.snapshots().map(
        (event) => event.docs.map((e) => Users.fromMap(e.data())).toList());
  }
}

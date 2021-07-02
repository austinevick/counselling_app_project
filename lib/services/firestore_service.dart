import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling_app_project/model/therapist.dart';
import 'package:counselling_app_project/model/user.dart';
import 'package:counselling_app_project/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  static User? user = AuthenticationService.currentUser;

  static saveUsersData(Users userData) async {
    final path = 'Users';
    final ref = FirebaseFirestore.instance.collection(path);
    await ref.doc(user!.uid).set(userData.toMap());
  }

  static Stream<List<Users>> fetchusersData() {
    final userRef = FirebaseFirestore.instance.collection('Users');
    return userRef.snapshots().map(
        (event) => event.docs.map((e) => Users.fromMap(e.data())).toList());
  }

  static saveTherapistsData(Therapist therapist) async {
    final path = 'Therapist';
    final CollectionReference<Map<String?, dynamic>> ref =
        FirebaseFirestore.instance.collection(path);
    await ref.doc(user!.uid).set(therapist.toMap());
  }

  static Stream<List<Therapist>> fetchTherapists() {
    final userRef = FirebaseFirestore.instance.collection('Therapists');
    return userRef.snapshots().map(
        (event) => event.docs.map((e) => Therapist.fromMap(e.data())).toList());
  }
}

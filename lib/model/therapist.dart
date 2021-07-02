import 'package:cloud_firestore/cloud_firestore.dart';

class Therapist {
  final String? fullName;
  final String? emailAddress;
  final String? phoneNumber;
  final String? nationality;
  final String? specialty;
  final String? imageUrl;
  final String? gender;
  final Timestamp? dateJoined;
  final String? experienceLength;
  Therapist({
    this.dateJoined,
    this.gender,
    this.imageUrl,
    this.specialty,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.nationality,
    this.experienceLength,
  });

  Map<String?, dynamic> toMap() {
    return {
      'gender': gender,
      'fullName': fullName,
      'specialty': specialty,
      'imageUrl': imageUrl,
      'emailAddress': emailAddress,
      'dateJoined': dateJoined,
      'phoneNumber': phoneNumber,
      'Nationality': nationality,
      'experienceLength': experienceLength,
    };
  }

  factory Therapist.fromMap(Map<String, dynamic> map) {
    return Therapist(
      fullName: map['fullName'],
      gender: map['gender'],
      imageUrl: map['imageUrl'],
      specialty: map['specialty'],
      dateJoined: map['dateJoined'],
      emailAddress: map['emailAddress'],
      phoneNumber: map['phoneNumber'],
      nationality: map['Nationality'],
      experienceLength: map['experienceLength'],
    );
  }
}
